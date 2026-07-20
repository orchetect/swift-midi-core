//
//  SysCommonTypes.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// Declarative System Common MIDI event types used in event filters.
    public enum SysCommonTypes {
        /// Return only System Common events.
        case only
        /// Return only System Common events matching a certain event type.
        case onlyType(SysCommonType)
        /// Return only System Common events matching certain event type(s).
        case onlyTypes(Set<SysCommonType>)

        /// Retain System Common events only with a certain type,
        /// while retaining all non-System Common events.
        case keepType(SysCommonType)
        /// Retain System Common events only with certain type(s),
        /// while retaining all non-System Common events.
        case keepTypes(Set<SysCommonType>)

        /// Drop all System Common events,
        /// while retaining all non-System Common events.
        case drop
        /// Drop all System Common events,
        /// while retaining all non-System Common events matching a certain event type.
        case dropType(SysCommonType)
        /// Drop all System Common events,
        /// while retaining all non-System Common events matching certain event type(s).
        case dropTypes(Set<SysCommonType>)
    }
}

extension MIDIEvent.SysCommonTypes: Equatable { }

extension MIDIEvent.SysCommonTypes: Hashable { }

extension MIDIEvent.SysCommonTypes: Sendable { }
