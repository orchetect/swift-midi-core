//
//  Number Formatting Tests.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftMIDIInternals
import Testing

@Suite struct NumberFormatting_Tests {
    @Test
    func roundedDecimalPlaces_Default() {
        #expect((1.126).rounded(decimalPlaces: 4) == 1.126)
        #expect((1.126).rounded(decimalPlaces: 3) == 1.126)
        #expect((1.126).rounded(decimalPlaces: 2) == 1.13)
        #expect((1.126).rounded(decimalPlaces: 1) == 1.1)
        #expect((1.126).rounded(decimalPlaces: 0) == 1.0)
        #expect((1.126).rounded(decimalPlaces: -1) == 1.0)
    }
}
