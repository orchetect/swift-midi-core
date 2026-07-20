//
//  MIDIEvent+Filter.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension Collection<MIDIEvent> {
    /// Filter Channel Voice events.
    public func filter(chanVoice types: MIDIEventFilter.ChannelVoice) -> [Element] {
        switch types {
        case .only:
            filter(\.isChannelVoice)

        case let .onlyType(specificType):
            filter { $0.isChannelVoice(ofType: specificType) }

        case let .onlyTypes(specificTypes):
            filter { $0.isChannelVoice(ofTypes: specificTypes) }

        case let .onlyChannel(channel):
            filter { $0.channel == channel }

        case let .onlyChannels(channels):
            filter {
                guard let channel = $0.channel else { return false }
                return channels.contains(channel)
            }

        case let .onlyCC(cc):
            filter {
                guard case let .cc(event) = $0
                else { return false }

                return event.controller == cc
            }

        case let .onlyCCs(ccs):
            filter {
                guard case let .cc(event) = $0
                else { return false }

                return ccs.contains(event.controller)
            }

        case let .onlyNotesInRange(noteRange):
            filter {
                switch $0 {
                case let .noteOn(noteOn):
                    noteRange.contains(noteOn.note.number)

                case let .noteOff(noteOff):
                    noteRange.contains(noteOff.note.number)

                default:
                    false
                }
            }

        case let .onlyNotesInRanges(noteRanges):
            filter {
                switch $0 {
                case let .noteOn(noteOn):
                    for noteRange in noteRanges {
                        if noteRange.contains(noteOn.note.number) { return true }
                    }
                    return false

                case let .noteOff(noteOff):
                    for noteRange in noteRanges {
                        if noteRange.contains(noteOff.note.number) { return true }
                    }
                    return false

                default:
                    return false
                }
            }

        case let .keepChannel(channel):
            filter {
                guard let _ = $0.channel else { return true }
                return $0.channel == channel
            }

        case let .keepChannels(channels):
            filter {
                guard let channel = $0.channel else { return true }
                return channels.contains(channel)
            }

        case let .keepType(specificType):
            filter {
                guard $0.isChannelVoice else { return true }
                return $0.isChannelVoice(ofType: specificType)
            }

        case let .keepTypes(specificTypes):
            filter {
                guard $0.isChannelVoice else { return true }
                return $0.isChannelVoice(ofTypes: specificTypes)
            }

        case let .keepCC(cc):
            filter {
                guard $0.isChannelVoice else { return true }

                guard case let .cc(event) = $0
                else { return true }

                return event.controller == cc
            }

        case let .keepCCs(ccs):
            filter {
                guard $0.isChannelVoice else { return true }

                guard case let .cc(event) = $0
                else { return true }

                return ccs.contains(event.controller)
            }

        case let .keepNotesInRange(noteRange):
            filter {
                switch $0 {
                case let .noteOn(noteOn):
                    noteRange.contains(noteOn.note.number)

                case let .noteOff(noteOff):
                    noteRange.contains(noteOff.note.number)

                default:
                    true
                }
            }

        case let .keepNotesInRanges(noteRanges):
            filter {
                switch $0 {
                case let .noteOn(noteOn):
                    for noteRange in noteRanges {
                        if noteRange.contains(noteOn.note.number) { return true }
                    }
                    return false

                case let .noteOff(noteOff):
                    for noteRange in noteRanges {
                        if noteRange.contains(noteOff.note.number) { return true }
                    }
                    return false

                default:
                    return true
                }
            }

        case .drop:
            filter { !$0.isChannelVoice }

        case let .dropChannel(channel):
            filter { $0.channel != channel }

        case let .dropChannels(channels):
            filter {
                guard let channel = $0.channel else { return true }
                return !channels.contains(channel)
            }

        case let .dropType(specificType):
            filter {
                guard $0.isChannelVoice else { return true }
                return !$0.isChannelVoice(ofType: specificType)
            }

        case let .dropTypes(specificTypes):
            filter {
                guard $0.isChannelVoice else { return true }
                return !$0.isChannelVoice(ofTypes: specificTypes)
            }

        case let .dropCC(cc):
            filter {
                guard case let .cc(event) = $0
                else { return true }

                return event.controller != cc
            }

        case let .dropCCs(ccs):
            filter {
                guard case let .cc(event) = $0
                else { return true }

                return !ccs.contains(event.controller)
            }

        case let .dropNotesInRange(noteRange):
            filter {
                switch $0 {
                case let .noteOn(noteOn):
                    !noteRange.contains(noteOn.note.number)

                case let .noteOff(noteOff):
                    !noteRange.contains(noteOff.note.number)

                default:
                    true
                }
            }

        case let .dropNotesInRanges(noteRanges):
            filter {
                switch $0 {
                case let .noteOn(noteOn):
                    for noteRange in noteRanges {
                        if noteRange.contains(noteOn.note.number) { return false }
                    }
                    return true

                case let .noteOff(noteOff):
                    for noteRange in noteRanges {
                        if noteRange.contains(noteOff.note.number) { return false }
                    }
                    return true

                default:
                    return true
                }
            }
        }
    }

    /// Filter System Common events.
    public func filter(sysCommon types: MIDIEventFilter.SystemCommon) -> [Element] {
        switch types {
        case .only:
            filter(\.isSystemCommon)

        case let .onlyType(specificType):
            filter { $0.isSystemCommon(ofType: specificType) }

        case let .onlyTypes(specificTypes):
            filter { $0.isSystemCommon(ofTypes: specificTypes) }

        case let .keepType(specificType):
            filter {
                guard $0.isSystemCommon else { return true }
                return $0.isSystemCommon(ofType: specificType)
            }

        case let .keepTypes(specificTypes):
            filter {
                guard $0.isSystemCommon else { return true }
                return $0.isSystemCommon(ofTypes: specificTypes)
            }

        case .drop:
            filter { !$0.isSystemCommon }

        case let .dropType(specificType):
            filter {
                guard $0.isSystemCommon else { return true }
                return !$0.isSystemCommon(ofType: specificType)
            }

        case let .dropTypes(specificTypes):
            filter {
                guard $0.isSystemCommon else { return true }
                return !$0.isSystemCommon(ofTypes: specificTypes)
            }
        }
    }

    /// Filter System Exclusive events.
    public func filter(sysEx types: MIDIEventFilter.SystemExclusive) -> [Element] {
        switch types {
        case .only:
            filter(\.isSystemExclusive)

        case let .onlyType(specificType):
            filter { $0.isSystemExclusive(ofType: specificType) }

        case let .onlyTypes(specificTypes):
            filter { $0.isSystemExclusive(ofTypes: specificTypes) }

        case let .keepType(specificType):
            filter {
                guard $0.isSystemExclusive else { return true }
                return $0.isSystemExclusive(ofType: specificType)
            }

        case let .keepTypes(specificTypes):
            filter {
                guard $0.isSystemExclusive else { return true }
                return $0.isSystemExclusive(ofTypes: specificTypes)
            }

        case .drop:
            filter { !$0.isSystemExclusive }

        case let .dropType(specificType):
            filter {
                guard $0.isSystemExclusive else { return true }
                return !$0.isSystemExclusive(ofType: specificType)
            }

        case let .dropTypes(specificTypes):
            filter {
                guard $0.isSystemExclusive else { return true }
                return !$0.isSystemExclusive(ofTypes: specificTypes)
            }
        }
    }

    /// Filter System Real-Time events.
    public func filter(sysRealTime types: MIDIEventFilter.SystemRealTime) -> [Element] {
        switch types {
        case .only:
            filter(\.isSystemRealTime)

        case let .onlyType(specificType):
            filter { $0.isSystemRealTime(ofType: specificType) }

        case let .onlyTypes(specificTypes):
            filter { $0.isSystemRealTime(ofTypes: specificTypes) }

        case let .keepType(specificType):
            filter {
                guard $0.isSystemRealTime else { return true }
                return $0.isSystemRealTime(ofType: specificType)
            }

        case let .keepTypes(specificTypes):
            filter {
                guard $0.isSystemRealTime else { return true }
                return $0.isSystemRealTime(ofTypes: specificTypes)
            }

        case .drop:
            filter { !$0.isSystemRealTime }

        case let .dropType(specificType):
            filter {
                guard $0.isSystemRealTime else { return true }
                return !$0.isSystemRealTime(ofType: specificType)
            }

        case let .dropTypes(specificTypes):
            filter {
                guard $0.isSystemRealTime else { return true }
                return !$0.isSystemRealTime(ofTypes: specificTypes)
            }
        }
    }

    /// Filter Utility events.
    public func filter(utility types: MIDIEventFilter.Utility) -> [Element] {
        switch types {
        case .only:
            filter(\.isUtility)

        case let .onlyType(specificType):
            filter { $0.isUtility(ofType: specificType) }

        case let .onlyTypes(specificTypes):
            filter { $0.isUtility(ofTypes: specificTypes) }

        case let .keepType(specificType):
            filter {
                guard $0.isUtility else { return true }
                return $0.isUtility(ofType: specificType)
            }

        case let .keepTypes(specificTypes):
            filter {
                guard $0.isUtility else { return true }
                return $0.isUtility(ofTypes: specificTypes)
            }

        case .drop:
            filter { !$0.isUtility }

        case let .dropType(specificType):
            filter {
                guard $0.isUtility else { return true }
                return !$0.isUtility(ofType: specificType)
            }

        case let .dropTypes(specificTypes):
            filter {
                guard $0.isUtility else { return true }
                return !$0.isUtility(ofTypes: specificTypes)
            }
        }
    }
}

// MARK: - UMP Group

extension Collection<MIDIEvent> {
    /// Filter events by UMP group.
    public func filter(group: UInt4) -> [Element] {
        filter { $0.group == group }
    }

    /// Filter events by UMP groups.
    public func filter(groups: [UInt4]) -> [Element] {
        filter { groups.contains($0.group) }
    }

    /// Drop all events with the specified UMP group.
    public func drop(group: UInt4) -> [Element] {
        filter { $0.group != group }
    }

    /// Drop all events with any of the specified UMP groups.
    public func drop(groups: [UInt4]) -> [Element] {
        filter { !groups.contains($0.group) }
    }
}
