//
//  PThreadMutex Variable Tests.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation
import SwiftMIDIInternals
import Testing

@Suite
struct PThreadMutex_Variable_Tests {
    private final class Wrapper: Sendable {
        let number: PThreadMutex<Int>

        init(number: Int = 0) {
            self.number = PThreadMutex(wrappedValue: number)
        }
    }

    // MARK: - Tests

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func differentThreadMutation() {
        let wrapper = Wrapper()

        #expect(wrapper.number.wrappedValue == 0)

        // local mutation
        wrapper.number.wrappedValue = 1
        #expect(wrapper.number.wrappedValue == 1)

        // mutation from another thread
        DispatchQueue.global().sync {
            wrapper.number.wrappedValue = 2
        }
        #expect(wrapper.number.wrappedValue == 2)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations() {
        let wrapper = Wrapper()

        #expect(wrapper.number.wrappedValue == 0)

        wrapper.number.wrappedValue = 1
        #expect(wrapper.number.wrappedValue == 1)

        wrapper.number.wrappedValue = 0
        DispatchQueue.concurrentPerform(iterations: 100) { iteration in
            wrapper.number.wrappedValue += 1
        }

        #expect(wrapper.number.wrappedValue == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_backgroundThread() {
        let wrapper = Wrapper()

        #expect(wrapper.number.wrappedValue == 0)

        wrapper.number.wrappedValue = 1
        #expect(wrapper.number.wrappedValue == 1)

        wrapper.number.wrappedValue = 0
        DispatchQueue.global().sync {
            DispatchQueue.concurrentPerform(iterations: 100) { iteration in
                #expect(!Thread.isMainThread)
                wrapper.number.wrappedValue += 1
            }
        }

        #expect(wrapper.number.wrappedValue == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_taskGroup() async {
        let wrapper = Wrapper()

        #expect(wrapper.number.wrappedValue == 0)

        wrapper.number.wrappedValue = 1
        #expect(wrapper.number.wrappedValue == 1)

        wrapper.number.wrappedValue = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { wrapper.number.wrappedValue += 1 }
            }
        }

        #expect(wrapper.number.wrappedValue == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @Test
    func concurrentMutations_fromMainActor() async {
        let wrapper = Wrapper()

        #expect(wrapper.number.wrappedValue == 0)

        wrapper.number.wrappedValue = 1
        #expect(wrapper.number.wrappedValue == 1)

        wrapper.number.wrappedValue = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { @MainActor in wrapper.number.wrappedValue += 1 }
            }
        }

        #expect(wrapper.number.wrappedValue == 100)
    }

    /// - Note: This test requires Thread Sanitizer enabled in the Test Plan.
    @MainActor @Test
    func concurrentMutations_fromMainActor_toMainActor() async {
        let wrapper = Wrapper()

        #expect(wrapper.number.wrappedValue == 0)

        wrapper.number.wrappedValue = 1
        #expect(wrapper.number.wrappedValue == 1)

        wrapper.number.wrappedValue = 0
        await withTaskGroup(of: Void.self) { group in
            for _ in 0 ..< 100 {
                group.addTask { @MainActor in wrapper.number.wrappedValue += 1 }
            }
        }

        #expect(wrapper.number.wrappedValue == 100)
    }
}
