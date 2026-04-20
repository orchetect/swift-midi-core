//
//  Channel Voice Tests.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

@testable import SwiftMIDICore
import Testing

@Suite struct MIDIEvent_ChannelVoiceTests_Tests {
    // MARK: - Channel Voice Event encoding
    
    @Test
    func programChange_RawBytes_MIDI1_0() {
        #expect(
            MIDIEvent.programChange(program: 0x64, bank: .noBankSelect, channel: 10, group: 0)
                .midi1RawBytes() ==
                [0xCA, 0x64]
        )
        
        #expect(
            MIDIEvent.programChange(program: 0x64, bank: .bankSelect(msb: 0x10, lsb: 0x00), channel: 10, group: 0)
                .midi1RawBytes() ==
                [
                    0xBA, 0x00, 0x10, // Bank Select MSB
                    0xBA, 0x20, 0x00, // Bank Select LSB
                    0xCA, 0x64 // Program Change
                ]
        )
        
        #expect(
            MIDIEvent.programChange(program: 0x64, bank: .bankSelect(msb: 0x10, lsb: 0x01), channel: 10, group: 0)
                .midi1RawBytes() ==
                [
                    0xBA, 0x00, 0x10, // Bank Select MSB
                    0xBA, 0x20, 0x01, // Bank Select LSB
                    0xCA, 0x64 // Program Change
                ]
        )
    }
    
    // TODO: Add unit tests for other Channel Voice events
}
