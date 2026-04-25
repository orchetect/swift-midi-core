//
//  MIDIPacketData.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftMIDIInternals

/// Platform-agnostic raw MIDI 1.0 packet data.
public struct MIDIPacketData<TimeStamp: Sendable, OutputEndpoint: Sendable> {
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
}

extension MIDIPacketData: Equatable where TimeStamp: Equatable, OutputEndpoint: Equatable { }

extension MIDIPacketData: Hashable where TimeStamp: Hashable, OutputEndpoint: Hashable { }

extension MIDIPacketData: Sendable { }
