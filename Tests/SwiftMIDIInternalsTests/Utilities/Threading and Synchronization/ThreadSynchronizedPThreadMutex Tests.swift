//
//  ThreadSynchronizedPThreadMutex Tests.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation
import SwiftMIDIInternals
import Testing

@Suite
struct ThreadSynchronizedPThreadMutex_Tests {
    private class Wrapper: @unchecked Sendable {
        @ThreadSynchronizedPThreadMutex var number: Int

        init(number: Int = 0) {
            self.number = number
        }
    }

    // MARK: - Tests

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func differentThreadMutation() {
        let wrapper = Wrapper()

        #expect(wrapper.number == 0)

        // local mutation
        wrapper.number = 1
        #expect(wrapper.number == 1)

        // mutation from another thread
        DispatchQueue.global().sync {
            wrapper.number = 2
        }
        #expect(wrapper.number == 2)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations() {
        let wrapper = Wrapper()

        #expect(wrapper.number == 0)

        wrapper.number = 1
        #expect(wrapper.number == 1)

        wrapper.number = 0
        DispatchQueue.concurrentPerform(iterations: 100) { iteration in
            wrapper.number += 1
        }

        #expect(wrapper.number == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_backgroundThread() {
        let wrapper = Wrapper()

        #expect(wrapper.number == 0)

        wrapper.number = 1
        #expect(wrapper.number == 1)

        wrapper.number = 0
        DispatchQueue.global().sync {
            DispatchQueue.concurrentPerform(iterations: 100) { iteration in
                wrapper.number += 1
            }
        }

        #expect(wrapper.number == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_taskGroup() async {
        let wrapper = Wrapper()

        #expect(wrapper.number == 0)

        wrapper.number = 1
        #expect(wrapper.number == 1)

        wrapper.number = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { wrapper.number += 1 }
            }
        }

        #expect(wrapper.number == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_taskGroup_fromMainActor() async {
        let wrapper = Wrapper()

        #expect(wrapper.number == 0)

        wrapper.number = 1
        #expect(wrapper.number == 1)

        wrapper.number = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { @MainActor in wrapper.number += 1 }
            }
        }

        #expect(wrapper.number == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @MainActor @Test
    func concurrentMutations_taskGroup_fromMainActor_toMainActor() async {
        let wrapper = Wrapper()

        #expect(wrapper.number == 0)

        wrapper.number = 1
        #expect(wrapper.number == 1)

        wrapper.number = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { @MainActor in wrapper.number += 1 }
            }
        }

        #expect(wrapper.number == 100)
    }
}
