//
//  SysRealTimeType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// System Real-Time MIDI event types.
    public enum SysRealTimeType {
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

extension MIDIEvent.SysRealTimeType: Equatable { }

extension MIDIEvent.SysRealTimeType: Hashable { }

extension MIDIEvent.SysRealTimeType: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEvent.SysRealTimeType: Sendable { }
