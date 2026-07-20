//
//  MIDIEventType SystemRealTime.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventType {
    /// System Real-Time MIDI event types.
    public enum SystemRealTime {
        /// System Real-Time: Timing Clock
        /// (MIDI 1.0 / 2.0)
        case timingClock

        /// System Real-Time: Start
        /// (MIDI 1.0 / 2.0)
        case start

        /// System Real-Time: Continue
        /// (MIDI 1.0 / 2.0)
        case `continue`

        /// System Real-Time: Stop
        /// (MIDI 1.0 / 2.0)
        case stop

        /// System Real-Time: Active Sensing
        /// (MIDI 1.0)
        case activeSensing

        /// System Real-Time: System Reset
        /// (MIDI 1.0 / 2.0)
        case systemReset
    }
}

extension MIDIEventType.SystemRealTime: Equatable { }

extension MIDIEventType.SystemRealTime: Hashable { }

extension MIDIEventType.SystemRealTime: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEventType.SystemRealTime: Sendable { }

extension MIDIEventType.SystemRealTime: CaseIterable { }
