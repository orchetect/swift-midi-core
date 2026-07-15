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
struct Main_Queue_Utilities_Tests {
    @MainActor @Test
    func checkIsOnMainQueue_MainActor() {
        #expect(isOnMainQueue())
    }

    @FooActor @Test
    func checkIsOnMainQueue_GlobalActor() {
        #expect(!isOnMainQueue())
    }

    @Test
    func checkIsOnMainQueue_ConcurrentMethod() async {
        @concurrent
        func check() async -> Bool {
            isOnMainQueue()
        }
        #expect(await !check())
    }

    @MainActor @Test
    func checkIsOnMainQueue_MainActor_ConcurrentMethod() async {
        @concurrent
        func check() async -> Bool {
            isOnMainQueue()
        }
        #expect(await !check())
    }

    @Test
    func checkIsOnMainQueue_MainDispatchQueue() {
        DispatchQueue.global().sync {
            DispatchQueue.main.sync {
                #expect(isOnMainQueue())
            }
        }
    }

    @Test
    func checkIsOnMainQueue_GlobalDispatchQueueWithinMainDispatchQueue() {
        DispatchQueue.main.sync {
            DispatchQueue.global().sync {
                #expect(!isOnMainQueue())
            }
        }
    }

    @Test
    func checkIsOnMainQueue_GlobalDispatchQueue() {
        DispatchQueue.global().sync {
            #expect(!isOnMainQueue())
        }
    }
}
