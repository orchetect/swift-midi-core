//
//  AnyMIDIPacketData.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

/// Type-erased box that can hold any MIDI packet data.
public enum AnyMIDIPacketData<TimeStamp: Sendable, OutputEndpoint: Sendable> {
    /// MIDI 1.0 MIDI Packet.
    case packet(MIDIPacketData<TimeStamp, OutputEndpoint>)

    /// MIDI 2.0 Universal MIDI Packet.
    case universalPacket(UniversalMIDIPacketData<TimeStamp, OutputEndpoint>)
}

extension AnyMIDIPacketData: Equatable where TimeStamp: Equatable, OutputEndpoint: Equatable { }

extension AnyMIDIPacketData: Hashable where TimeStamp: Hashable, OutputEndpoint: Hashable { }

extension AnyMIDIPacketData: Sendable { }

extension AnyMIDIPacketData {
    /// Flat array of raw bytes.
    public var bytes: [UInt8] {
        switch self {
        case let .packet(packetData):
            packetData.bytes

        case let .universalPacket(universalPacketData):
            universalPacketData.bytes
        }
    }

    /// Core MIDI packet timestamp.
    public var timeStamp: TimeStamp {
        switch self {
        case let .packet(packetData):
            packetData.timeStamp

        case let .universalPacket(universalPacketData):
            universalPacketData.timeStamp
        }
    }

    /// The MIDI endpoint from which the packet originated.
    /// If this information is not available, it may be `nil`.
    public var source: OutputEndpoint? {
        switch self {
        case let .packet(packetData):
            packetData.source

        case let .universalPacket(universalPacketData):
            universalPacketData.source
        }
    }
}
