//
//  MIDIEventType Utility.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventType {
    /// Utility MIDI event types.
    public enum Utility {
        case noOp
        case jrClock
        case jrTimestamp
    }
}

extension MIDIEventType.Utility: Equatable { }

extension MIDIEventType.Utility: Hashable { }

extension MIDIEventType.Utility: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEventType.Utility: Sendable { }

extension MIDIEventType.Utility: CaseIterable { }
