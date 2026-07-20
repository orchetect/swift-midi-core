//
//  SwiftMIDICore-API-1.1.0.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventType.ChannelVoice")
    public typealias ChanVoiceType = MIDIEventType.ChannelVoice

    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventType.SystemCommon")
    public typealias SysCommonType = MIDIEventType.SystemCommon

    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventType.SystemExclusive")
    public typealias SysExType = MIDIEventType.SystemExclusive

    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventType.SystemRealTime")
    public typealias SysRealTimeType = MIDIEventType.SystemRealTime

    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventType.Utility")
    public typealias UtilityType = MIDIEventType.Utility
}

extension MIDIEvent {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventFilter.ChannelVoice")
    public typealias ChanVoiceTypes = MIDIEventFilter.ChannelVoice

    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventFilter.SystemCommon")
    public typealias SysCommonTypes = MIDIEventFilter.SystemCommon

    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventFilter.SystemExclusive")
    public typealias SysExTypes = MIDIEventFilter.SystemExclusive
}
