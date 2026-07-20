//
//  UtilityType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// Utility MIDI event types.
    public enum UtilityType {
        case noOp
        case jrClock
        case jrTimestamp
    }
}

extension MIDIEvent.UtilityType: Equatable { }

extension MIDIEvent.UtilityType: Hashable { }

extension MIDIEvent.UtilityType: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEvent.UtilityType: Sendable { }
