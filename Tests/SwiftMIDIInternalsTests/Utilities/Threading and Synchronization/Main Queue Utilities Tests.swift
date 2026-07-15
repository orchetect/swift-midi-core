//
//  Main Queue Utilities Tests.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation
@testable import SwiftMIDIInternals
import Testing

@globalActor fileprivate actor FooActor {
    static let shared = FooActor()
}

@Suite
struct Main_Queue_Utilities_isOnMainThread_Tests {
    @MainActor @Test
    func checkIsOnMainQueue_MainActor() {
        #expect(isOnMainThread())
    }

    @FooActor @Test
    func checkIsOnMainQueue_GlobalActor() {
        #expect(!isOnMainThread())
    }

    @Test
    func checkIsOnMainQueue_ConcurrentMethod() async {
        @concurrent
        func check() async -> Bool {
            isOnMainThread()
        }
        #expect(await !check())
    }

    @MainActor @Test
    func checkIsOnMainQueue_MainActor_ConcurrentMethod() async {
        @concurrent
        func check() async -> Bool {
            isOnMainThread()
        }
        #expect(await !check())
    }

    @Test
    func checkIsOnMainQueue_MainDispatchQueue() {
        DispatchQueue.global().sync {
            DispatchQueue.main.sync {
                #expect(isOnMainThread())
            }
        }
    }

    @Test
    func checkIsOnMainQueue_GlobalDispatchQueueWithinMainDispatchQueue() {
        DispatchQueue.main.sync {
            DispatchQueue.global().sync {
                MainActor.assertIsolated()
                #expect(Thread.isMainThread)
                #expect(isOnMainThread())
            }
        }
    }

    @Test
    func checkIsOnMainQueue_GlobalDispatchQueue() {
        DispatchQueue.global().sync {
            #expect(!isOnMainThread())
        }
    }

    @MainActor @Test
    func checkIsOnMainQueue_MainActor_CustomDispatchQueue() async {
        let queue = DispatchQueue(
            label: "TestQueue",
            qos: .userInitiated,
            attributes: [],
            target: .global()
        )
        await confirmation(expectedCount: 1) { confirm in
            queue.sync {
                if Thread.isMainThread { confirm() }
            }
        }
        // queue sync in main thread context executes in main thread
        await confirmation(expectedCount: 1) { confirm in
            queue.sync {
                if isOnMainThread() { confirm() }
            }
        }
    }

    @FooActor @Test
    func checkIsOnMainQueue_GlobalActor_CustomDispatchQueue() async {
        let queue = DispatchQueue(
            label: "TestQueue",
            qos: .userInitiated,
            attributes: [],
            target: .global()
        )
        await confirmation(expectedCount: 0) { confirm in
            queue.sync {
                if Thread.isMainThread { confirm() }
            }
        }

        await confirmation(expectedCount: 1) { confirm in
            DispatchQueue.main.sync {
                if Thread.isMainThread { confirm() }
            }
        }
        await confirmation(expectedCount: 0) { confirm in
            queue.sync {
                if isOnMainThread() { confirm() }
            }
        }
        await confirmation(expectedCount: 1) { confirm in
            DispatchQueue.main.sync {
                if isOnMainThread() { confirm() }
            }
        }
    }
}

@Suite
struct Main_Queue_Utilities_withMainThread_Tests {
    @MainActor @Test
    func checkIsOnMainQueue_MainActor() {
        withMainThread {
            MainActor.assertIsolated()
            #expect(Thread.isMainThread)
            #expect(isOnMainThread())
        }
    }

    @FooActor @Test
    func checkIsOnMainQueue_GlobalActor() {
        withMainThread {
            #expect(Thread.isMainThread)
            #expect(isOnMainThread())
        }
    }

    @Test
    func checkIsOnMainQueue_ConcurrentMethod() async {
        @concurrent
        func check() async -> Bool {
            withMainThread {
                Thread.isMainThread && isOnMainThread()
            }
        }
        #expect(await check())
    }

    @MainActor @Test
    func checkIsOnMainQueue_MainActor_ConcurrentMethod() async {
        @concurrent
        func check() async -> Bool {
            withMainThread {
                Thread.isMainThread && isOnMainThread()
            }
        }
        #expect(await check())
    }

    @Test
    func checkIsOnMainQueue_MainDispatchQueue() {
        DispatchQueue.global().sync {
            DispatchQueue.main.sync {
                withMainThread {
                    MainActor.assertIsolated()
                    #expect(Thread.isMainThread)
                    #expect(isOnMainThread())
                }
            }
        }
    }

    @Test
    func checkIsOnMainQueue_GlobalDispatchQueueWithinMainDispatchQueue() {
        DispatchQueue.main.sync {
            DispatchQueue.global().sync {
                withMainThread {
                    #expect(Thread.isMainThread)
                    #expect(isOnMainThread())
                }
            }
        }
    }

    @MainActor @Test
    func checkIsOnMainQueue_MainActor_GlobalDispatchQueueSync() {
        DispatchQueue.global().sync {
            withMainThread {
                #expect(Thread.isMainThread)
                #expect(isOnMainThread())
            }
        }
    }

    @FooActor @Test
    func checkIsOnMainQueue_GlobalDispatchQueueSync() {
        DispatchQueue.global().sync {
            withMainThread {
                #expect(Thread.isMainThread)
                #expect(isOnMainThread())
            }
        }
    }

    @MainActor @Test
    func checkIsOnMainQueue_MainActor_CustomDispatchQueue() async {
        let queue = DispatchQueue(
            label: "TestQueue",
            qos: .userInitiated,
            attributes: [],
            target: .global()
        )
        await confirmation(expectedCount: 1) { confirm in
            queue.sync {
                withMainThread {
                    if Thread.isMainThread { confirm() }
                }
            }
        }
        await confirmation(expectedCount: 1) { confirm in
            queue.sync {
                withMainThread {
                    if isOnMainThread() { confirm() }
                }
            }
        }
    }

    @FooActor @Test
    func checkIsOnMainQueue_GlobalActor_CustomDispatchQueue() async {
        let queue = DispatchQueue(
            label: "TestQueue",
            qos: .userInitiated,
            attributes: [],
            target: .global()
        )
        await confirmation(expectedCount: 1) { confirm in
            queue.sync {
                withMainThread {
                    if Thread.isMainThread { confirm() }
                }
            }
        }

        await confirmation(expectedCount: 1) { confirm in
            DispatchQueue.main.sync {
                withMainThread {
                    if Thread.isMainThread { confirm() }
                }
            }
        }
        await confirmation(expectedCount: 1) { confirm in
            queue.sync {
                withMainThread {
                    if isOnMainThread() { confirm() }
                }
            }
        }
        await confirmation(expectedCount: 1) { confirm in
            DispatchQueue.main.sync {
                withMainThread {
                    if isOnMainThread() { confirm() }
                }
            }
        }
    }
}
