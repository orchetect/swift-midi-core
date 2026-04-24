//
//  SwiftMIDICore-API-1.0.0.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [[UMPWord]] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

// MARK: Channel Voice

extension MIDIEvent.NoteOn {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [UMPWord] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

extension MIDIEvent.NoteOff {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [UMPWord] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

extension MIDIEvent.NoteCC {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.NotePitchBend {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.NotePressure {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [UMPWord] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

extension MIDIEvent.NoteManagement {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.CC {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [UMPWord] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

extension MIDIEvent.ProgramChange {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [UMPWord] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

extension MIDIEvent.Pressure {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [UMPWord] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

extension MIDIEvent.PitchBend {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [UMPWord] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

// MARK: Channel Voice - Parameter Number Messages

extension MIDIEvent.RPN {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [[UMPWord]] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

extension MIDIEvent.NRPN {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords(protocol:)")
    public func umpRawWords(protocol midiProtocol: MIDIProtocolVersion) -> [[UMPWord]] {
        midi2RawUMPWords(protocol: midiProtocol)
    }
}

// MARK: System Exclusive

extension MIDIEvent.SysEx7 {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [[UMPWord]] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.UniversalSysEx7 {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [[UMPWord]] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.SysEx8 {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [[UMPWord]] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.UniversalSysEx8 {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [[UMPWord]] {
        midi2RawUMPWords()
    }
}

// MARK: System Common

extension MIDIEvent.TimecodeQuarterFrame {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.SongPositionPointer {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.SongSelect {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.TuneRequest {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

// MARK: System Real-Time

extension MIDIEvent.TimingClock {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.Start {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.Continue {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.Stop {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.ActiveSensing {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.SystemReset {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

// MARK: MIDI 2.0 Utility Messages

extension MIDIEvent.NoOp {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.JRClock {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}

extension MIDIEvent.JRTimestamp {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "midi2RawUMPWords")
    public func umpRawWords() -> [UMPWord] {
        midi2RawUMPWords()
    }
}
