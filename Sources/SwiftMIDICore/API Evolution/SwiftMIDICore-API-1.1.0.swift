//
//  SwiftMIDICore-API-1.1.0.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent {
    @_documentation(visibility: internal)
    @available(*, deprecated, renamed: "MIDIEventType.ChannelVoice")
    public typealias ChanVoiceType = MIDIEventType.ChannelVoice
}
