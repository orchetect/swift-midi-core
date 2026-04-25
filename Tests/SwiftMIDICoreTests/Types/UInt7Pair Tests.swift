//
//  UInt7Pair Tests.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftMIDICore
import Testing

@Suite
struct UInt7Pair_Tests {
    @Test
    func uInt14Value() {
        let pair = UInt7Pair(msb: 0x7F, lsb: 0x7F)

        let uInt14 = pair.uInt14Value

        #expect(uInt14 == UInt14.max)
    }
}
