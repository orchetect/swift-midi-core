# Event Filters

## Table of Contents

- [Channel Voice](#Channel-Voice)
- [System Common](#System-Common)
- [System Exclusive](#System-Exclusive)
- [System Real-Time](#System-Real-Time)
- [Utility](#Utility) (MIDI 2.0 Only)
- [UMP Group](#UMP-Group) (MIDI 2.0 Only)

## Summary

Filters are available as category methods on ``MIDIEvent`` collections.

For example:

```swift
let events: [MIDIEvent] = [ ... ]

let onlyChannel0Events = events.filter(chanVoice: .onlyChannel(0))
```

Filters may be chained easily:

```swift
// - removes Active Sensing,
// - removes all channel voice except CC 1, 11, or 64 events on "channel 1"
// - retains all other Sys Common, Sys Exclusive, and Sys Real-Time events
let filteredEvents = events
    .filter(sysRealTime: .dropTypes([.activeSensing]))
    .filter(chanVoice: .keepChannel(0x0))
    .filter(chanVoice: .keepCCs([1, 11, 64]))
```

## Channel Voice

There are three main categories of Channel Voice event filter masks:

- **only**: retains only events matching the criteria
- **keep**: keeps Channel Voice events matching the criteria, while all non-Channel Voice events are retained
- **drop**: drops Channel Voice events matching the criteria, while all non-Channel Voice events are retained

Channel Voice filter type(s) (``MIDIEventType/ChannelVoice``) available:

- ``MIDIEventType/ChannelVoice/noteOn``
- ``MIDIEventType/ChannelVoice/noteOff``
- ``MIDIEventType/ChannelVoice/noteCC`` (MIDI 2.0 Only)
- ``MIDIEventType/ChannelVoice/notePitchBend`` (MIDI 2.0 Only)
- ``MIDIEventType/ChannelVoice/notePressure``
- ``MIDIEventType/ChannelVoice/noteManagement`` (MIDI 2.0 Only)
- ``MIDIEventType/ChannelVoice/cc``
- ``MIDIEventType/ChannelVoice/programChange``
- ``MIDIEventType/ChannelVoice/pressure``
- ``MIDIEventType/ChannelVoice/pitchBend``
- ``MIDIEventType/ChannelVoice/rpn``
- ``MIDIEventType/ChannelVoice/nrpn``

### Only

`.filter(chanVoice: .only*)` methods:

- retains only Channel Voice events matching the criteria

```swift
// return only Channel Voice events
.filter(chanVoice: .only)
```

```swift
// return only certain event type(s)
.filter(chanVoice: .onlyType(.noteOn))
.filter(chanVoice: .onlyTypes([.noteOn, .noteOff]))
```

```swift
// return only events on certain channel(s)
.filter(chanVoice: .onlyChannel(0x0))
.filter(chanVoice: .onlyChannels([0x0, 0x1, 0x2]))
```

```swift
// return only CC events matching certain controller(s)
.filter(chanVoice: .onlyCC(1))
.filter(chanVoice: .onlyCCs([1, 11, 64]))
```

```swift
// return only note on/off events within certain note number range(s)
.filter(chanVoice: .onlyNotesInRange(40 ... 80))
.filter(chanVoice: .onlyNotesInRanges([20 ... 40, 60 ... 80]))
```

### Keep

`.filter(chanVoice: .keep*)` methods:

- retains Channel Voice events matching the given criteria
- retains all non-Channel Voice events

```swift
// retains Channel Voice events only with certain type(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .keepType(.noteOn))
.filter(chanVoice: .keepTypes([.noteOn, .noteOff]))
```

```swift
// retains Channel Voice events only with certain channel(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .keepChannel(0x0))
.filter(chanVoice: .keepChannels([0x0, 0x1, 0x2]))
```

```swift
// retains only CC events with certain controller(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .keepCC(1))
.filter(chanVoice: .keepCCs([1, 11, 64]))
```

```swift
// retains only note on/off events within certain note ranges(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .keepNotesInRange(40 ... 80))
.filter(chanVoice: .keepNotesInRanges([20 ... 40, 60 ... 80]))
```

### Drop

`.filter(chanVoice: .drop*)` methods:

- filter any Channel Voice events by the given criteria
- do not affect non-Channel Voice events

```swift
// drop all Channel Voice events,
// while retaining all non-Channel Voice events
.filter(chanVoice: .drop)
```

```swift
// drop Channel Voice events only with certain type(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .dropType(.noteOn))
.filter(chanVoice: .dropTypes([.noteOn, .noteOff]))
```

```swift
// drop Channel Voice events only with certain channel(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .dropChannel(0x0))
.filter(chanVoice: .dropChannels([0x0, 0x1, 0x2]))
```

```swift
// drop CC events with certain controller(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .dropCC(1))
.filter(chanVoice: .dropCCs([1, 11, 64]))
```

```swift
// drop note on/off events within certain note ranges(s),
// while retaining all non-Channel Voice events
.filter(chanVoice: .dropNotesInRange(40 ... 80))
.filter(chanVoice: .dropNotesInRanges([20 ... 40, 60 ... 80]))
```

## System Common

System Common filter type(s) (``MIDIEventType/SystemCommon``) available:

- ``MIDIEventType/SystemCommon/songPositionPointer``
- ``MIDIEventType/SystemCommon/songSelect``
- ``MIDIEventType/SystemCommon/timecodeQuarterFrame``
- ``MIDIEventType/SystemCommon/tuneRequest``

### Only

```swift
.filter(sysCommon: .only)
.filter(sysCommon: .onlyType(.songSelect))
.filter(sysCommon: .onlyTypes([.songSelect, .tuneRequest]))
```

### Keep

```swift
.filter(sysCommon: .keepType(.songSelect))
.filter(sysCommon: .keepTypes([.songSelect, .tuneRequest]))
```

### Drop

```swift
.filter(sysCommon: .drop)
.filter(sysCommon: .dropType(.songSelect))
.filter(sysCommon: .dropTypes([.songSelect, .tuneRequest]))
```

## System Exclusive

System Exclusive filter type(s) (``MIDIEventType/SystemExclusive``) available:

- ``MIDIEventType/SystemExclusive/sysEx7``
- ``MIDIEventType/SystemExclusive/universalSysEx7``
- ``MIDIEventType/SystemExclusive/sysEx8`` (MIDI 2.0 Only)
- ``MIDIEventType/SystemExclusive/universalSysEx8`` (MIDI 2.0 Only)

### Only

```swift
.filter(sysEx: .only)
.filter(sysEx: .onlyType(.sysEx))
.filter(sysEx: .onlyTypes([.sysEx, .universalSysEx]))
```

### Keep

```swift
.filter(sysEx: .keepType(.sysEx))
.filter(sysEx: .keepTypes([.sysEx, .universalSysEx]))
```

### Drop

```swift
.filter(sysEx: .drop)
.filter(sysEx: .dropType(.sysEx))
.filter(sysEx: .dropTypes([.sysEx, .universalSysEx]))
```

## System Real-Time

System Real-Time filter type(s) (``MIDIEventType/SystemRealTime``) available:

- ``MIDIEventType/SystemRealTime/activeSensing`` (deprecated in MIDI 2.0)
- ``MIDIEventType/SystemRealTime/continue``
- ``MIDIEventType/SystemRealTime/start``
- ``MIDIEventType/SystemRealTime/stop``
- ``MIDIEventType/SystemRealTime/systemReset``
- ``MIDIEventType/SystemRealTime/timingClock``

### Only

```swift
.filter(sysRealTime: .only)
.filter(sysRealTime: .onlyType(.timingClock))
.filter(sysRealTime: .onlyTypes([.start, .stop, .continue]))
```

### Keep

```swift
.filter(sysRealTime: .keepType(.timingClock))
.filter(sysRealTime: .keepTypes([.start, .stop, .continue]))
```

### Drop

```swift
.filter(sysRealTime: .drop)
.filter(sysRealTime: .dropType(.activeSensing))
.filter(sysRealTime: .dropTypes([.activeSensing, .timingClock]))
```

## Utility

Utility filter type(s) (``MIDIEventType/Utility``) available:

- ``MIDIEventType/Utility/noOp`` (MIDI 2.0 Only)
- ``MIDIEventType/Utility/jrClock`` (MIDI 2.0 Only)
- ``MIDIEventType/Utility/jrTimestamp`` (MIDI 2.0 Only)

### Only

```swift
.filter(sysRealTime: .only)
.filter(sysRealTime: .onlyType(.noOp))
.filter(sysRealTime: .onlyTypes([.jrClock, .jrTimestamp]))
```

### Keep

```swift
.filter(sysRealTime: .keepType(.noOp))
.filter(sysRealTime: .keepTypes([.jrClock, .jrTimestamp]))
```

### Drop

```swift
.filter(sysRealTime: .drop)
.filter(sysRealTime: .dropType(.noOp))
.filter(sysRealTime: .dropTypes([.jrClock, .jrTimestamp]))
```

## UMP Group

### Filter

```swift
// retains only events in the given UMP group(s)
.filter(group: 0)
.filter(groups: [0, 1])
```

### Drop

```swift
// drops events in the given UMP group(s)
.drop(group: 0)
.drop(groups: [0, 1])
```

## Topics

### Types

- ``MIDIEventType``
- ``MIDIEventFilter``
- ``MIDIEventFilterGroup``

### Filter Methods

- ``Swift/Collection/filter(chanVoice:)``
- ``Swift/Collection/filter(sysCommon:)``
- ``Swift/Collection/filter(sysEx:)``
- ``Swift/Collection/filter(sysRealTime:)``
- ``Swift/Collection/filter(utility:)``
- ``Swift/Collection/filter(group:)``
- ``Swift/Collection/filter(groups:)``
- ``Swift/Collection/drop(group:)``
- ``Swift/Collection/drop(groups:)``
