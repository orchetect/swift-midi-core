//
//  UniversalMIDIPacketData.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import CoreMIDI
import SwiftMIDIInternals

/// Platform-agnostic raw MIDI 2.0 UMP (Universal MIDI Packet) packet data.
public struct UniversalMIDIPacketData<TimeStamp, OutputEndpoint>
where TimeStamp: Sendable, OutputEndpoint: Sendable
{
    // /// Universal MIDI Packet Words
    // public let words: [UMPWord]
    
    /// Flat array of raw bytes
    public let bytes: [UInt8]
    
    /// Core MIDI packet timestamp
    public let timeStamp: TimeStamp
    
    /// The MIDI endpoint from which the packet originated.
    /// If this information is not available, it may be `nil`.
    public let source: OutputEndpoint?
    
    public init(
        bytes: [UInt8],
        timeStamp: TimeStamp,
        source: OutputEndpoint? = nil
    ) {
        self.bytes = bytes
        self.timeStamp = timeStamp
        self.source = source
    }
    
    public init(
        words: [UMPWord],
        timeStamp: TimeStamp,
        source: OutputEndpoint? = nil
    ) {
        bytes = words.umpWordsToBytes()
        self.timeStamp = timeStamp
        self.source = source
    }
}

extension UniversalMIDIPacketData: Equatable where TimeStamp: Equatable, OutputEndpoint: Equatable { }

extension UniversalMIDIPacketData: Hashable where TimeStamp: Hashable, OutputEndpoint: Hashable { }

extension UniversalMIDIPacketData: Sendable { }
