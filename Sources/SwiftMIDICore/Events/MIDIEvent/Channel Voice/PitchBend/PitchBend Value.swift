//
//  PitchBend Value.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent.PitchBend {
    /// Channel Voice 14-Bit (MIDI 1.0) / 32-Bit (MIDI 2.0) Value.
    public typealias Value = MIDIEvent.ChanVoice14Bit32BitValue

    /// Channel Voice 14-Bit (MIDI 1.0) / 32-Bit (MIDI 2.0) Value.
    public typealias ValueValidated = Value.Validated
}
