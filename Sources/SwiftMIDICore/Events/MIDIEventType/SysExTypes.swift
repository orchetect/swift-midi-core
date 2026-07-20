//
//  SysExTypes.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// Declarative System Exclusive MIDI event types used in event filters.
    public enum SysExTypes {
        /// Return only System Exclusive events.
        case only
        /// Return only System Exclusive events matching a certain event type.
        case onlyType(SysExType)
        /// Return only System Exclusive events matching certain event type(s).
        case onlyTypes(Set<SysExType>)

        /// Retain System Exclusive events only with a certain type,
        /// while retaining all non-System Exclusive events.
        case keepType(SysExType)
        /// Retain System Exclusive events only with certain type(s),
        /// while retaining all non-System Exclusive events.
        case keepTypes(Set<SysExType>)

        /// Drop all System Exclusive events,
        /// while retaining all non-System Exclusive events.
        case drop
        /// Drop all System Exclusive events,
        /// while retaining all non-System Exclusive events matching a certain event type.
        case dropType(SysExType)
        /// Drop all System Exclusive events,
        /// while retaining all non-System Exclusive events matching certain event type(s).
        case dropTypes(Set<SysExType>)
    }
}

extension MIDIEvent.SysExTypes: Equatable { }

extension MIDIEvent.SysExTypes: Hashable { }

extension MIDIEvent.SysExTypes: Sendable { }
