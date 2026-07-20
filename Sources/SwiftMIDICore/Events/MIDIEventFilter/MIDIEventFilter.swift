//
//  MIDIEventFilter.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

/// MIDI event filter definition.
public enum MIDIEventFilter{
    /// Channel Voice MIDI event types.
    case chanVoice(ChannelVoice)

    /// System Common MIDI event types.
    case sysCommon(SystemCommon)

    /// System Exclusive MIDI event types.
    case sysEx(SystemExclusive)

    /// System Real-Time MIDI event types.
    case sysRealTime(SystemRealTime)

    /// Utility MIDI event types.
    case utility(Utility)

    /// UMP group.
    case group(UInt4)

    /// UMP groups.
    case groups([UInt4])
}

extension MIDIEventFilter: Equatable { }

extension MIDIEventFilter: Hashable { }

extension MIDIEventFilter: Sendable { }

extension MIDIEventFilter {
    /// Process MIDI events using this filter.
    public func apply(to events: [MIDIEvent]) -> [MIDIEvent] {
        switch self {
        case let .chanVoice(types):
            events.filter(chanVoice: types)

        case let .sysCommon(types):
            events.filter(sysCommon: types)

        case let .sysEx(types):
            events.filter(sysEx: types)

        case let .sysRealTime(types):
            events.filter(sysRealTime: types)

        case let .utility(types):
            events.filter(utility: types)

        case let .group(group):
            events.filter(group: group)

        case let .groups(groups):
            events.filter(groups: groups)
        }
    }
}
