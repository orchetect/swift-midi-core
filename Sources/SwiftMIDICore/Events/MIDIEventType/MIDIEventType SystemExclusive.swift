//
//  MIDIEventType SystemExclusive.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventType {
    /// System Exclusive MIDI event types.
    public enum SystemExclusive {
        /// System Exclusive: Manufacturer-specific (7-bit)
        /// (MIDI 1.0 / 2.0)
        case sysEx7

        /// Universal System Exclusive (7-bit)
        /// (MIDI 1.0 / 2.0)
        case universalSysEx7

        /// System Exclusive: Manufacturer-specific (8-bit)
        /// (MIDI 2.0 only)
        case sysEx8

        /// Universal System Exclusive (8-bit)
        /// (MIDI 2.0 only)
        case universalSysEx8
    }
}

extension MIDIEventType.SystemExclusive: Equatable { }

extension MIDIEventType.SystemExclusive: Hashable { }

extension MIDIEventType.SystemExclusive: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEventType.SystemExclusive: Sendable { }
