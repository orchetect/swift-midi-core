//
//  MIDIEventFilter SystemCommon.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventFilter {
    /// Declarative System Common MIDI event types used in event filters.
    public enum SystemCommon {
        /// Return only System Common events.
        case only
        /// Return only System Common events matching a certain event type.
        case onlyType(MIDIEventType.SystemCommon)
        /// Return only System Common events matching certain event type(s).
        case onlyTypes(Set<MIDIEventType.SystemCommon>)

        /// Retain System Common events only with a certain type,
        /// while retaining all non-System Common events.
        case keepType(MIDIEventType.SystemCommon)
        /// Retain System Common events only with certain type(s),
        /// while retaining all non-System Common events.
        case keepTypes(Set<MIDIEventType.SystemCommon>)

        /// Drop all System Common events,
        /// while retaining all non-System Common events.
        case drop
        /// Drop all System Common events,
        /// while retaining all non-System Common events matching a certain event type.
        case dropType(MIDIEventType.SystemCommon)
        /// Drop all System Common events,
        /// while retaining all non-System Common events matching certain event type(s).
        case dropTypes(Set<MIDIEventType.SystemCommon>)
    }
}

extension MIDIEventFilter.SystemCommon: Equatable { }

extension MIDIEventFilter.SystemCommon: Hashable { }

extension MIDIEventFilter.SystemCommon: Sendable { }
