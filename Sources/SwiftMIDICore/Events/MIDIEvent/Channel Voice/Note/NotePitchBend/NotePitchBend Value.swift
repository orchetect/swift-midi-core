//
//  NotePitchBend Value.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent.NotePitchBend {
    /// Channel Voice 32-Bit Value
    /// (MIDI 2.0)
    public typealias Value = MIDIEvent.ChanVoice32BitValue

    /// Channel Voice 32-Bit Value
    /// (MIDI 2.0)
    public typealias ValueValidated = Value.Validated
}
