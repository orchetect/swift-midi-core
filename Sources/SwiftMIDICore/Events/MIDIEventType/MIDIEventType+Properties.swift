//
//  MIDIEventType+Properties.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEventType {
    /// Returns `true` if the event type is that of a Channel Voice message.
    public var isChannelVoice: Bool {
        guard case .channelVoice = self else {
            return false
        }
        return true
    }

    /// Returns `true` if the event type is that of a System Common message.
    public var isSystemCommon: Bool {
        guard case .systemCommon = self else {
            return false
        }
        return true
    }

    /// Returns `true` if the event type is that of a System Exclusive message.
    public var isSystemExclusive: Bool {
        guard case .systemExclusive = self else {
            return false
        }
        return true
    }

    /// Returns `true` if the event type is that of a System Real-Time message.
    public var isSystemRealTime: Bool {
        guard case .systemRealTime = self else {
            return false
        }
        return true
    }

    /// Returns `true` if the event type is that of a Utility message.
    public var isUtility: Bool {
        guard case .utility = self else {
            return false
        }
        return true
    }
}
