//
//  NoteOff Tests.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

@testable import SwiftMIDICore
import Testing

@Suite struct MIDIEvent_NoteOff_Tests {
    // swiftformat:options --wrapcollections preserve
    // swiftformat:disable spaceInsideParens spaceInsideBrackets
    
    typealias NoteOff = MIDIEvent.NoteOff
    
    // MARK: - Standard Note tests
    
    @Test
    func midi1() {
        for noteNum: UInt7 in 0 ... 127 {
            let cc: MIDIEvent = .noteOff(
                noteNum,
                velocity: .midi1(64),
                attribute: .none,
                channel: 0x1
            )
            
            #expect(
                cc.midi1RawBytes() ==
                    [0x81, noteNum.uInt8Value, 64]
            )
        }
    }
    
    @Test
    func ump_MIDI1_0() {
        for noteNum: UInt7 in 0 ... 127 {
            let cc: MIDIEvent = .noteOff(
                noteNum,
                velocity: .midi1(64),
                attribute: .none,
                channel: 0x1,
                group: 0x9
            )
            
            #expect(
                cc.midi2RawUMPWords(protocol: .midi1_0) ==
                    [[
                        UMPWord(
                            0x29,
                            0x81,
                            noteNum.uInt8Value,
                            64
                        )
                    ]]
            )
        }
    }
    
    @Test
    func ump_MIDI2_0() {
        for noteNum: UInt7 in 0 ... 127 {
            let cc: MIDIEvent = .noteOff(
                noteNum,
                velocity: .midi1(64),
                attribute: .none,
                channel: 0x1,
                group: 0x9
            )
            
            #expect(
                cc.midi2RawUMPWords(protocol: .midi2_0) ==
                    [[
                        UMPWord(
                            0x49,
                            0x81,
                            noteNum.uInt8Value,
                            0x00
                        ),
                        UMPWord(
                            0x80,
                            0x00,
                            0x00,
                            0x00
                        )
                    ]]
            )
        }
    }
    
    @Test
    func ump_MIDI2_0_WithAttribute() {
        for noteNum: UInt7 in 0 ... 127 {
            let cc: MIDIEvent = .noteOff(
                noteNum,
                velocity: .midi1(127),
                attribute: .pitch7_9(
                    coarse: 0b1101100,
                    fine: 0b1_10011110
                ),
                channel: 0x1,
                group: 0x9
            )
            
            #expect(
                cc.midi2RawUMPWords(protocol: .midi2_0) ==
                    [[
                        UMPWord(
                            0x49,
                            0x81,
                            noteNum.uInt8Value,
                            0x03
                        ),
                        UMPWord(
                            0xFF,
                            0xFF,
                            0b11011001,
                            0b10011110
                        )
                    ]]
            )
        }
    }
}
