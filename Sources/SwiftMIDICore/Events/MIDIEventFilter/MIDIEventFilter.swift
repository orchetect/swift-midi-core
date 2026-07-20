//
//  MIDIEventFilter.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

/// MIDI event filter definition.
public enum MIDIEventFilter{
    case chanVoice(ChannelVoice)
    case sysCommon(SystemCommon)
    case sysEx(MIDIEvent.SysExTypes)
    case sysRealTime(MIDIEvent.SysRealTimeTypes)
    case utility(MIDIEvent.UtilityTypes)

    case group(UInt4)
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
