//
//  MIDIEvent+MIDIEventType.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

// MARK: - MIDIEventType

extension MIDIEvent {
    /// Returns the event type.
    @inlinable
    public var eventType: MIDIEventType {
        switch self {
        case .noteOn: .channelVoice(.noteOn)
        case .noteOff: .channelVoice(.noteOff)
        case .noteCC: .channelVoice(.noteCC)
        case .notePitchBend: .channelVoice(.notePitchBend)
        case .notePressure: .channelVoice(.notePressure)
        case .noteManagement: .channelVoice(.noteManagement)
        case .cc: .channelVoice(.cc)
        case .programChange: .channelVoice(.programChange)
        case .pitchBend: .channelVoice(.pitchBend)
        case .pressure: .channelVoice(.pressure)
        case .rpn: .channelVoice(.rpn)
        case .nrpn: .channelVoice(.nrpn)
        case .sysEx7: .systemExclusive(.sysEx7)
        case .universalSysEx7: .systemExclusive(.universalSysEx7)
        case .sysEx8: .systemExclusive(.sysEx8)
        case .universalSysEx8: .systemExclusive(.universalSysEx8)
        case .timecodeQuarterFrame: .systemCommon(.timecodeQuarterFrame)
        case .songPositionPointer: .systemCommon(.songPositionPointer)
        case .songSelect: .systemCommon(.songSelect)
        case .tuneRequest: .systemCommon(.tuneRequest)
        case .timingClock: .systemRealTime(.timingClock)
        case .start: .systemRealTime(.start)
        case .continue: .systemRealTime(.continue)
        case .stop: .systemRealTime(.stop)
        case .activeSensing: .systemRealTime(.activeSensing)
        case .systemReset: .systemRealTime(.systemReset)
        case .noOp: .utility(.noOp)
        case .jrClock: .utility(.jrClock)
        case .jrTimestamp: .utility(.jrTimestamp)
        }
    }
}

// MARK: - Channel Voice

extension MIDIEvent {
    /// Returns `true` if the event is a Channel Voice message.
    public var isChannelVoice: Bool {
        eventType.isChannelVoice
    }

    /// Returns `true` if the event is a Channel Voice message of a specific type.
    public func isChannelVoice(ofType chanVoiceType: MIDIEventType.ChannelVoice) -> Bool {
        eventType == .channelVoice(chanVoiceType)
    }

    /// Returns `true` if the event is a Channel Voice message of a specific type.
    public func isChannelVoice(ofTypes chanVoiceTypes: Set<MIDIEventType.ChannelVoice>) -> Bool {
        for eventType in chanVoiceTypes {
            if isChannelVoice(ofType: eventType) { return true }
        }
        return false
    }
}

// MARK: - System Common

extension MIDIEvent {
    /// Returns `true` if the event is a System Common message.
    public var isSystemCommon: Bool {
        eventType.isSystemCommon
    }

    /// Returns `true` if the event is a System Common message of a specific type.
    public func isSystemCommon(ofType sysCommonType: MIDIEventType.SystemCommon) -> Bool {
        eventType == .systemCommon(sysCommonType)
    }

    /// Returns `true` if the event is a System Common message of a specific type.
    public func isSystemCommon(ofTypes sysCommonTypes: Set<MIDIEventType.SystemCommon>) -> Bool {
        for eventType in sysCommonTypes {
            if isSystemCommon(ofType: eventType) { return true }
        }
        return false
    }
}

// MARK: - System Exclusive

extension MIDIEvent {
    /// Returns `true` if the event is a System Exclusive message.
    public var isSystemExclusive: Bool {
        eventType.isSystemExclusive
    }

    /// Returns `true` if the event is a System Exclusive message of a specific type.
    public func isSystemExclusive(ofType sysExType: MIDIEventType.SystemExclusive) -> Bool {
        eventType == .systemExclusive(sysExType)
    }

    /// Returns `true` if the event is a System Exclusive message of a specific type.
    public func isSystemExclusive(ofTypes sysExTypes: Set<MIDIEventType.SystemExclusive>) -> Bool {
        for eventType in sysExTypes {
            if isSystemExclusive(ofType: eventType) { return true }
        }
        return false
    }
}

// MARK: - System Real-Time

extension MIDIEvent {
    /// Returns `true` if the event is a System Real-Time message.
    public var isSystemRealTime: Bool {
        eventType.isSystemRealTime
    }

    /// Returns `true` if the event is a System Real-Time message of a specific type.
    public func isSystemRealTime(ofType sysRealTimeType: MIDIEventType.SystemRealTime) -> Bool {
        eventType == .systemRealTime(sysRealTimeType)
    }

    /// Returns `true` if the event is a System Real-Time message of a specific type.
    public func isSystemRealTime(ofTypes sysRealTimeTypes: Set<MIDIEventType.SystemRealTime>) -> Bool {
        for eventType in sysRealTimeTypes {
            if isSystemRealTime(ofType: eventType) { return true }
        }
        return false
    }
}

// MARK: - Utility

extension MIDIEvent {
    /// Returns `true` if the event is a Utility message.
    public var isUtility: Bool {
        eventType.isUtility
    }

    /// Returns `true` if the event is a Utility message of a specific type.
    public func isUtility(ofType utilityType: MIDIEventType.Utility) -> Bool {
        eventType == .utility(utilityType)
    }

    /// Returns `true` if the event is a Utility message of a specific type.
    public func isUtility(ofTypes utilityTypes: Set<MIDIEventType.Utility>) -> Bool {
        for eventType in utilityTypes {
            if isUtility(ofType: eventType) { return true }
        }
        return false
    }
}
