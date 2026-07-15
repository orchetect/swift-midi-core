//
//  Main Queue Utilities.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import class Foundation.DispatchQueue
import class Foundation.DispatchSpecificKey
import class Foundation.Thread

// MARK: - Global Dispatch Queue Identity

// We store the dispatch key and value globally so they aren't bound to the generic type
private let mainQueueKey = DispatchSpecificKey<UInt8>()
private let mainQueueValue: UInt8 = 1

private let _setupMainQueueIdentity: Void = {
    DispatchQueue.main.setSpecific(key: mainQueueKey, value: mainQueueValue)
}()

/// Indicates whether the current execution context is on the main queue.
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
@inline(__always)
public func isOnMainThread() -> Bool {
    _ = _setupMainQueueIdentity
    
    return Thread.isMainThread
        || DispatchQueue.getSpecific(key: mainQueueKey) == mainQueueValue
}
