//
//  Double Extensions Tests.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftMIDICore
import Testing

@Suite struct DoubleExtensions_Tests {
    @Test
    func initBipolarUnitInterval_Float() {
        #expect(Double(bipolarUnitInterval: Float(-1.0)) == 0.00)
        #expect(Double(bipolarUnitInterval: Float(-0.5)) == 0.25)
        #expect(Double(bipolarUnitInterval: Float(0.0)) == 0.50)
        #expect(Double(bipolarUnitInterval: Float(0.5)) == 0.75)
        #expect(Double(bipolarUnitInterval: Float(1.0)) == 1.00)
    }
    
    @Test
    func initBipolarUnitInterval_Double() {
        #expect(Double(bipolarUnitInterval: -1.0) == 0.00)
        #expect(Double(bipolarUnitInterval: -0.5) == 0.25)
        #expect(Double(bipolarUnitInterval:  0.0) == 0.50)
        #expect(Double(bipolarUnitInterval:  0.5) == 0.75)
        #expect(Double(bipolarUnitInterval:  1.0) == 1.00)
    }
    
    @Test
    func bipolarUnitIntervalValue() {
        #expect(0.00.bipolarUnitIntervalValue == -1.0)
        #expect(0.25.bipolarUnitIntervalValue == -0.5)
        #expect(0.50.bipolarUnitIntervalValue ==  0.0)
        #expect(0.75.bipolarUnitIntervalValue ==  0.5)
        #expect(1.00.bipolarUnitIntervalValue ==  1.0)
    }
}
