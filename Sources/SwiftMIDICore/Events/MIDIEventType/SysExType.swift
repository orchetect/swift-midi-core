//
//  SysExType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// System Exclusive MIDI event types.
    public enum SysExType {
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

extension MIDIEvent.SysExType: Equatable { }

extension MIDIEvent.SysExType: Hashable { }

extension MIDIEvent.SysExType: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEvent.SysExType: Sendable { }
