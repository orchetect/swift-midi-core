//
//  SysRealTimeTypes.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// Declarative System Real-Time MIDI event types used in event filters.
    public enum SysRealTimeTypes {
        /// Return only System Real-Time events.
        case only
        /// Return only System Real-Time events matching a certain event type.
        case onlyType(SysRealTimeType)
        /// Return only System Real-Time events matching certain event type(s).
        case onlyTypes(Set<SysRealTimeType>)

        /// Retain System Real-Time events only with a certain type,
        /// while retaining all non-System Real-Time events.
        case keepType(SysRealTimeType)
        /// Retain System Real-Time events only with certain type(s),
        /// while retaining all non-System Real-Time events.
        case keepTypes(Set<SysRealTimeType>)

        /// Drop all System Real-Time events,
        /// while retaining all non-System Real-Time events.
        case drop
        /// Drop all System Real-Time events,
        /// while retaining all non-System Real-Time events matching a certain event type.
        case dropType(SysRealTimeType)
        /// Drop all System Real-Time events,
        /// while retaining all non-System Real-Time events matching certain event type(s).
        case dropTypes(Set<SysRealTimeType>)
    }
}

extension MIDIEvent.SysRealTimeTypes: Equatable { }

extension MIDIEvent.SysRealTimeTypes: Hashable { }

extension MIDIEvent.SysRealTimeTypes: Sendable { }
