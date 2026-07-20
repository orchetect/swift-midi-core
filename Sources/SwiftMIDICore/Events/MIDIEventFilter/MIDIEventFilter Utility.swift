//
//  MIDIEventFilter Utility.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventFilter {
    /// Declarative Utility MIDI event types used in event filters.
    public enum Utility {
        /// Return only Utility events.
        case only
        /// Return only Utility events matching a certain event type.
        case onlyType(MIDIEventType.Utility)
        /// Return only Utility events matching certain event type(s).
        case onlyTypes(Set<MIDIEventType.Utility>)

        /// Retain Utility events only with a certain type,
        /// while retaining all non-Utility events.
        case keepType(MIDIEventType.Utility)
        /// Retain Utility events only with certain type(s),
        /// while retaining all non-Utility events.
        case keepTypes(Set<MIDIEventType.Utility>)

        /// Drop all Utility events,
        /// while retaining all non-Utility events.
        case drop
        /// Drop all Utility events,
        /// while retaining all non-Utility events matching a certain event type.
        case dropType(MIDIEventType.Utility)
        /// Drop all Utility events,
        /// while retaining all non-Utility events matching certain event type(s).
        case dropTypes(Set<MIDIEventType.Utility>)
    }
}

extension MIDIEventFilter.Utility: Equatable { }

extension MIDIEventFilter.Utility: Hashable { }

extension MIDIEventFilter.Utility: Sendable { }
