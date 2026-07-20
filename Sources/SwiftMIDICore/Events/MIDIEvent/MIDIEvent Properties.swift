//
//  MIDIEvent Properties.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

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

    /// Returns the event's channel, if one is associated with it.
    @inlinable
    public var channel: UInt4? {
        switch self {
        // -------------------
        // MARK: Channel Voice
        // -------------------

        case let .noteOn(event):
            event.channel

        case let .noteOff(event):
            event.channel

        case let .noteCC(event):
            event.channel

        case let .notePitchBend(event):
            event.channel

        case let .notePressure(event):
            event.channel

        case let .noteManagement(event):
            event.channel

        case let .cc(event):
            event.channel

        case let .programChange(event):
            event.channel

        case let .pressure(event):
            event.channel

        case let .pitchBend(event):
            event.channel

        // -----------------------------------------------
        // MARK: Channel Voice - Parameter Number Messages
        // -----------------------------------------------

        case let .rpn(event):
            event.channel

        case let .nrpn(event):
            event.channel

        default:
            nil
        }
    }

    /// Returns the event's UMP group.
    @inlinable
    public var group: UInt4 {
        switch self {
        // -------------------
        // MARK: Channel Voice
        // -------------------

        case let .noteOn(event):
            event.group

        case let .noteOff(event):
            event.group

        case let .noteCC(event):
            event.group

        case let .notePitchBend(event):
            event.group

        case let .notePressure(event):
            event.group

        case let .noteManagement(event):
            event.group

        case let .cc(event):
            event.group

        case let .programChange(event):
            event.group

        case let .pressure(event):
            event.group

        case let .pitchBend(event):
            event.group

        // -----------------------------------------------
        // MARK: Channel Voice - Parameter Number Messages
        // -----------------------------------------------

        case let .rpn(event):
            event.group

        case let .nrpn(event):
            event.group

        // ----------------------
        // MARK: System Exclusive
        // ----------------------

        case let .sysEx7(event):
            event.group

        case let .universalSysEx7(event):
            event.group

        case let .sysEx8(event):
            event.group

        case let .universalSysEx8(event):
            event.group

        // -------------------
        // MARK: System Common
        // -------------------

        case let .timecodeQuarterFrame(event):
            event.group

        case let .songPositionPointer(event):
            event.group

        case let .songSelect(event):
            event.group

        case let .tuneRequest(event):
            event.group

        // ----------------------
        // MARK: System Real-Time
        // ----------------------

        case let .timingClock(event):
            event.group

        case let .start(event):
            event.group

        case let .continue(event):
            event.group

        case let .stop(event):
            event.group

        case let .activeSensing(event):
            event.group

        case let .systemReset(event):
            event.group

        // -------------------------------
        // MARK: MIDI 2.0 Utility Messages
        // -------------------------------

        case let .noOp(event):
            event.group

        case let .jrClock(event):
            event.group

        case let .jrTimestamp(event):
            event.group
        }
    }
}
