//
//  MIDIEventType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

/// MIDI event type.
public enum MIDIEventType {
    case channelVoice(ChannelVoice)
    case systemCommon(SystemCommon)
    case systemExclusive(SystemExclusive)
    case systemRealTime(SystemRealTime)
    case utility(MIDIEvent.UtilityType)
}

extension MIDIEventType: Equatable { }

extension MIDIEventType: Hashable { }

extension MIDIEventType: Identifiable {
    public var id: Self {
        self
    }
}

extension MIDIEventType: Sendable { }
