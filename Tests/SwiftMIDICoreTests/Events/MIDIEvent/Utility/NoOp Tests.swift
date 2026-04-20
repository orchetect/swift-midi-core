//
//  NoOp Tests.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

@testable import SwiftMIDICore
import Testing

@Suite struct MIDIEventNoOp_Tests {
    // swiftformat:options --wrapcollections preserve
    
    typealias NoOp = MIDIEvent.NoOp
    
    @Test
    func noOp() {
        for grp: UInt4 in 0x0 ... 0xF {
            let event: MIDIEvent = .noOp(group: grp)
            
            #expect(
                event.umpRawWords(protocol: .midi2_0) ==
                    [[
                        UMPWord(
                            0x00 + grp.uInt8Value,
                            0x00,
                            0x00,
                            0x00
                        )
                    ]]
            )
        }
    }
}
