//
//  MIDIEventFilter SystemRealTime.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventFilter {
    /// Declarative System Real-Time MIDI event types used in event filters.
    public enum SystemRealTime {
        /// Return only System Real-Time events.
        case only
        /// Return only System Real-Time events matching a certain event type.
        case onlyType(MIDIEventType.SystemRealTime)
        /// Return only System Real-Time events matching certain event type(s).
        case onlyTypes(Set<MIDIEventType.SystemRealTime>)

        /// Retain System Real-Time events only with a certain type,
        /// while retaining all non-System Real-Time events.
        case keepType(MIDIEventType.SystemRealTime)
        /// Retain System Real-Time events only with certain type(s),
        /// while retaining all non-System Real-Time events.
        case keepTypes(Set<MIDIEventType.SystemRealTime>)

        /// Drop all System Real-Time events,
        /// while retaining all non-System Real-Time events.
        case drop
        /// Drop all System Real-Time events,
        /// while retaining all non-System Real-Time events matching a certain event type.
        case dropType(MIDIEventType.SystemRealTime)
        /// Drop all System Real-Time events,
        /// while retaining all non-System Real-Time events matching certain event type(s).
        case dropTypes(Set<MIDIEventType.SystemRealTime>)
    }
}

extension MIDIEventFilter.SystemRealTime: Equatable { }

extension MIDIEventFilter.SystemRealTime: Hashable { }

extension MIDIEventFilter.SystemRealTime: Sendable { }
