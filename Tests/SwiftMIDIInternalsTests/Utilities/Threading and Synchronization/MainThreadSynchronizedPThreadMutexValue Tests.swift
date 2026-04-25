//
//  MainThreadSynchronizedPThreadMutexValue Tests.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation
import SwiftMIDIInternals
import Testing

@Suite
struct MainThreadSynchronizedPThreadMutexValue_Tests {
    private final class Wrapper: @unchecked Sendable {
        /* nonisolated(unsafe) */
        @PThreadMutex // seems redundant, however we need it to prevent overlapping access since we're storing a value type
        var number: MainThreadSynchronizedPThreadMutexValue<Int>

        init(number: Int = 0) {
            self.number = MainThreadSynchronizedPThreadMutexValue(number)
        }
    }

    // MARK: - Tests

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func differentThreadMutation() {
        let wrapper = Wrapper()

        #expect(wrapper.number.value == 0)

        // local mutation
        wrapper.number.value = 1
        #expect(wrapper.number.value == 1)

        // mutation from another thread
        DispatchQueue.global().sync {
            wrapper.number.value = 2
        }
        #expect(wrapper.number.value == 2)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations() {
        let wrapper = Wrapper()

        #expect(wrapper.number.value == 0)

        wrapper.number.value = 1
        #expect(wrapper.number.value == 1)

        wrapper.number.value = 0
        DispatchQueue.concurrentPerform(iterations: 100) { iteration in
            wrapper.number.value += 1
        }

        #expect(wrapper.number.value == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_backgroundThread() {
        let wrapper = Wrapper()

        #expect(wrapper.number.value == 0)

        wrapper.number.value = 1
        #expect(wrapper.number.value == 1)

        wrapper.number.value = 0
        DispatchQueue.global().sync {
            DispatchQueue.concurrentPerform(iterations: 100) { iteration in
                wrapper.number.value += 1
            }
        }

        #expect(wrapper.number.value == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_taskGroup() async {
        let wrapper = Wrapper()

        #expect(wrapper.number.value == 0)

        wrapper.number.value = 1
        #expect(wrapper.number.value == 1)

        wrapper.number.value = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { wrapper.number.value += 1 }
            }
        }

        #expect(wrapper.number.value == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_taskGroup_fromMainActor() async {
        let wrapper = Wrapper()

        #expect(wrapper.number.value == 0)

        wrapper.number.value = 1
        #expect(wrapper.number.value == 1)

        wrapper.number.value = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { @MainActor in wrapper.number.value += 1 }
            }
        }

        #expect(wrapper.number.value == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @MainActor @Test
    func concurrentMutations_taskGroup_fromMainActor_toMainActor() async {
        let wrapper = Wrapper()

        #expect(wrapper.number.value == 0)

        wrapper.number.value = 1
        #expect(wrapper.number.value == 1)

        wrapper.number.value = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { @MainActor in wrapper.number.value += 1 }
            }
        }

        #expect(wrapper.number.value == 100)
    }
}
