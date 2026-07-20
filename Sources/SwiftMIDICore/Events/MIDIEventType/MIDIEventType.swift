//
//  MIDIEventType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

/// MIDI event type.
public enum MIDIEventType {
    /// Channel Voice MIDI event type.
    case channelVoice(ChannelVoice)

    /// System Common MIDI event type.
    case systemCommon(SystemCommon)

    /// System Exclusive MIDI event type.
    case systemExclusive(SystemExclusive)

    /// System Real-Time MIDI event type.
    case systemRealTime(SystemRealTime)

    /// Utility MIDI event type.
    case utility(Utility)
}

extension MIDIEventType: Equatable { }

extension MIDIEventType: Hashable { }

extension MIDIEventType: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEventType: Sendable { }

extension MIDIEventType: CaseIterable {
    public static let allCases: [MIDIEventType] = {
        var types: [MIDIEventType] = []
        types += ChannelVoice.allCases.map { .channelVoice($0) }
        types += SystemCommon.allCases.map { .systemCommon($0) }
        types += SystemExclusive.allCases.map { .systemExclusive($0) }
        types += SystemRealTime.allCases.map { .systemRealTime($0) }
        types += Utility.allCases.map { .utility($0) }
        return types
    }()
}
