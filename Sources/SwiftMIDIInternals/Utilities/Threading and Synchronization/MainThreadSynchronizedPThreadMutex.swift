//
//  MainThreadSynchronizedPThreadMutex.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Global Dispatch Queue Identity

/// Uses main-queue identity instead of `Thread.isMainThread`.
///
/// `Thread.isMainThread` only tells us whether execution is on the process's main
/// OS thread; it does not reliably tell us whether we are already executing on
/// `DispatchQueue.main`/`MainActor`, particularly under Swift Concurrency on Linux.
///
/// That distinction matters because a false negative can cause us to call
/// `DispatchQueue.main.sync` while we are already running on the main executor,
/// which can deadlock.
///
/// We therefore use a dispatch-specific key attached to `DispatchQueue.main`,
/// which checks queue identity rather than thread identity and is safer for
/// re-entrant access across both GCD and Swift Concurrency code paths.

// We store the dispatch key and value globally so they aren't bound to the generic type
private let mainQueueKey = DispatchSpecificKey<UInt8>()
private let mainQueueValue: UInt8 = 1

private let _setupMainQueueIdentity: Void = {
    DispatchQueue.main.setSpecific(key: mainQueueKey, value: mainQueueValue)
}()

@inline(__always)
private func isOnMainQueue() -> Bool {
    _ = _setupMainQueueIdentity
    return DispatchQueue.getSpecific(key: mainQueueKey) == mainQueueValue
}

// MARK: - Property Wrapper

/// A property wrapper that ensures serialized thread-safe access to a value by synchronizing reads and writes on the main thread.
@_documentation(visibility: internal)
@propertyWrapper
public final class MainThreadSynchronizedPThreadMutex<T> {
    private nonisolated let queue: DispatchQueue = .main
    private let lock = PThreadRWLock()
    nonisolated(unsafe) private let storage: ValueWrapper

    public init(wrappedValue value: T) {
        if isOnMainQueue() {
            storage = ValueWrapper(value)
        } else {
            storage = queue.sync { ValueWrapper(value) }
        }
    }

    public var wrappedValue: T {
        get {
            lock.readLock()
            defer { lock.unlock() }
            if isOnMainQueue() {
                return storage.value
            } else {
                return queue.sync { storage.value }
            }
        }
        _modify {
            lock.writeLock()
            defer { lock.unlock() }
            if isOnMainQueue() {
                yield &storage.value
            } else {
                var value = queue.sync { storage.value }
                yield &value
                queue.sync { storage.value = value }
            }
        }
        set {
            lock.writeLock()
            defer { lock.unlock() }
            if isOnMainQueue() {
                storage.value = newValue
            } else {
                queue.sync { storage.value = newValue }
            }
        }
    }
}

extension MainThreadSynchronizedPThreadMutex: Equatable where T: Equatable {
    public static func == (lhs: MainThreadSynchronizedPThreadMutex<T>, rhs: MainThreadSynchronizedPThreadMutex<T>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}

extension MainThreadSynchronizedPThreadMutex: Hashable where T: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}

extension MainThreadSynchronizedPThreadMutex: Sendable where T: Sendable { }

// MARK: - Methods

extension MainThreadSynchronizedPThreadMutex {
    @discardableResult
    public func withReadLock<Result, E>(_ block: (T) throws(E) -> Result) rethrows -> Result {
        lock.readLock()
        defer { lock.unlock() }


        if isOnMainQueue() {
            return try block(storage.value)
        } else {
            return try queue.sync { try block(storage.value) }
        }
    }

    @discardableResult @_disfavoredOverload
    public func withWriteLock<Result, E>(_ block: (inout T) throws(E) -> Result) rethrows -> Result {
        lock.writeLock()
        defer { lock.unlock() }


        if isOnMainQueue() {
            return try block(&storage.value)
        } else {
            return try queue.sync { try block(&storage.value) }
        }
    }
}

// MARK: - Helpers

extension MainThreadSynchronizedPThreadMutex {
    fileprivate final class ValueWrapper {
        var value: T

        init(_ value: T) {
            self.value = value
        }
    }
}

extension MainThreadSynchronizedPThreadMutex.ValueWrapper: Equatable where T: Equatable {
    static func == (
        lhs: MainThreadSynchronizedPThreadMutex<T>.ValueWrapper,
        rhs: MainThreadSynchronizedPThreadMutex<T>.ValueWrapper
    ) -> Bool {
        lhs.value == rhs.value
    }
}

extension MainThreadSynchronizedPThreadMutex.ValueWrapper: Hashable where T: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}