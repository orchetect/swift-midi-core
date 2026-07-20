//
//  ChanVoiceType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    /// Channel Voice MIDI event types.
    public enum ChanVoiceType {
        /// Channel Voice Message: Note On
        /// (MIDI 1.0 / 2.0)
        case noteOn

        /// Channel Voice Message: Note Off
        /// (MIDI 1.0 / 2.0)
        case noteOff

        /// Channel Voice Message: Per-Note Control Change (CC)
        /// (MIDI 2.0)
        case noteCC

        /// Channel Voice Message: Per-Note Pitch Bend
        /// (MIDI 2.0)
        case notePitchBend

        /// Channel Voice Message: Per-Note Aftertouch (Polyphonic Aftertouch)
        /// (MIDI 1.0 / 2.0)
        ///
        /// Also known as:
        /// - Pro Tools: "Polyphonic Aftertouch"
        /// - Logic Pro: "Polyphonic Aftertouch"
        /// - Cubase: "Poly Pressure"
        case notePressure

        /// Channel Voice Message: Per-Note Management
        /// (MIDI 2.0)
        ///
        /// The MIDI 2.0 Protocol introduces a Per-Note Management message to enable independent
        /// control from Per- Note Controllers to multiple Notes on the same Note Number.
        case noteManagement

        /// Channel Voice Message: Channel Control Change (CC)
        /// (MIDI 1.0 / 2.0)
        case cc

        /// Channel Voice Message: Channel Program Change
        /// (MIDI 1.0 / 2.0)
        case programChange

        /// Channel Voice Message: Channel Pitch Bend
        /// (MIDI 1.0 / 2.0)
        case pitchBend

        /// Channel Voice Message: Channel Pressure (Aftertouch)
        /// (MIDI 1.0 / 2.0)
        ///
        /// Also known as:
        /// - Pro Tools: "Mono Aftertouch"
        /// - Logic Pro: "Aftertouch"
        /// - Cubase: "Aftertouch"
        case pressure

        /// RPN (Registered Parameter Number) Message,
        /// also referred to as Registered Controller in MIDI 2.0.
        /// (MIDI 1.0 / 2.0)
        case rpn

        /// NRPN (Non-Registered Parameter Number) Message,
        /// also referred to as Assignable Controller in MIDI 2.0.
        /// (MIDI 1.0 / 2.0)
        case nrpn
    }
}

extension MIDIEvent.ChanVoiceType: Equatable { }

extension MIDIEvent.ChanVoiceType: Hashable { }

extension MIDIEvent.ChanVoiceType: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEvent.ChanVoiceType: Sendable { }
