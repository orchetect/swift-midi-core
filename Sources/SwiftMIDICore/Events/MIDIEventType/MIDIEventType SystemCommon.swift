//
//  MIDIEventType SystemCommon.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventType {
    /// System Common MIDI event types.
    public enum SystemCommon {
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

extension MIDIEventType.SystemCommon: Equatable { }

extension MIDIEventType.SystemCommon: Hashable { }

extension MIDIEventType.SystemCommon: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEventType.SystemCommon: Sendable { }

extension MIDIEventType.SystemCommon: CaseIterable { }
