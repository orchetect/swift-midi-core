//
//  AdvancedMIDI2Parser.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation
import SwiftMIDIInternals

/// Wrapper for ``MIDI2Parser`` that adds certain heuristics, including RPN/NRPN bundling.
public final class AdvancedMIDI2Parser<TimeStamp, OutputEndpoint>: @unchecked Sendable
where TimeStamp: Sendable, OutputEndpoint: Sendable
{ // @unchecked required for @PThreadMutex use
    // MARK: - Options
    
    @PThreadMutex
    public var bundleRPNAndNRPNDataEntryLSB: Bool = false
    
    public typealias EventsHandler = @Sendable (
        _ events: [MIDIEvent],
        _ timeStamp: TimeStamp,
        _ source: OutputEndpoint?
    ) -> Void
    
    @PThreadMutex
    public var handleEvents: EventsHandler?
    
    // MARK: - Internal State
    
    private let parser = MIDI2Parser()
    private let pnBundler: ParameterNumberEventBundler<TimeStamp, OutputEndpoint>
    
    public init(
        handleEvents: EventsHandler? = nil
    ) {
        self.handleEvents = handleEvents
        
        pnBundler = ParameterNumberEventBundler()
        pnBundler.handleEvents = { [weak self] events, timeStamp, source in
            self?.handleEvents?(events, timeStamp, source)
        }
    }
}

// MARK: - Public Methods

extension AdvancedMIDI2Parser {
    public func parseEvents(
        in packetData: UniversalMIDIPacketData<TimeStamp, OutputEndpoint>
    ) {
        parseEvents(
            in: packetData.bytes,
            timeStamp: packetData.timeStamp,
            source: packetData.source
        )
    }
    
    public func parseEvents(
        in bytes: [UInt8],
        timeStamp: TimeStamp = 0,
        source: OutputEndpoint? = nil
    ) {
        var events = parser.parsedEvents(in: bytes)
        process(
            parsedEvents: &events,
            timeStamp: timeStamp,
            source: source
        )
    }
}

// MARK: - Internal Methods

extension AdvancedMIDI2Parser {
    // This method is broken out to make unit testing easier.
    func process(
        parsedEvents events: inout [MIDIEvent],
        timeStamp: TimeStamp = 0,
        source: OutputEndpoint? = nil
    ) {
        var events = events
        
        if bundleRPNAndNRPNDataEntryLSB {
            pnBundler.process(events: &events, timeStamp: timeStamp, source: source)
        }
        
        handleEvents?(events, timeStamp, source)
    }
}
