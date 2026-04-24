//
//  JRTimestamp Tests.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

@testable import SwiftMIDICore
import Testing

@Suite struct MIDIEventJRTimestamp_Tests {
    // swiftformat:options --wrapcollections preserve
    
    typealias JRTimestamp = MIDIEvent.JRTimestamp
    
    @Test
    func jrTimestamp() {
        for grp: UInt4 in 0x0 ... 0xF {
            let event: MIDIEvent = .jrTimestamp(
                time: 0x1234,
                group: grp
            )
            
            #expect(
                event.midi2RawUMPWords(protocol: .midi2_0) ==
                    [[
                        UMPWord(
                            0x00 + grp.uInt8Value,
                            0x20,
                            0x12,
                            0x34
                        )
                    ]]
            )
        }
    }
}
