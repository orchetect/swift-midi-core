//
//  SysCommonType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// System Common MIDI event types.
    public enum SysCommonType {
        /// System Common: Timecode Quarter-Frame
        /// (MIDI 1.0 / 2.0)
        case timecodeQuarterFrame

        /// System Common: Song Position Pointer
        /// (MIDI 1.0 / 2.0)
        case songPositionPointer

        /// System Common: Song Select
        /// (MIDI 1.0 / 2.0)
        case songSelect

        /// System Common: Tune Request
        /// (MIDI 1.0 / 2.0)
        case tuneRequest
    }
}

extension MIDIEvent.SysCommonType: Equatable { }

extension MIDIEvent.SysCommonType: Hashable { }

extension MIDIEvent.SysCommonType: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEvent.SysCommonType: Sendable { }
