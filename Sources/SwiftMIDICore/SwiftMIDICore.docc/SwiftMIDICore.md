# ``SwiftMIDICore``

Essential MIDI types used by all modules in SwiftMIDI.

![swift-midi-core](swift-midi-core-banner.png)

![Topology Diagram](swift-midi-topology.svg)

SwiftMIDICore contains the essential data types and MIDI event definitions used in SwiftMIDI.

See the Getting Started guide in **swift-midi** docs for essential information on getting the most from SwiftMIDI.

## Topics

### Events

- ``MIDIEvent``
- <doc:MIDINote>
- <doc:Event-Filters>
- <doc:Value-Types>

### MIDI Packets

- ``AnyMIDIPacketData``
- ``MIDIPacketData``
- ``UniversalMIDIPacketData``

### MIDI Parsers

- ``MIDI1Parser``
- ``MIDI2Parser``
- ``AdvancedMIDI2Parser``

### Protocols

- ``ReceivesMIDIEvents``
- ``SendsMIDIEvents``

### Core Internals

- <doc:Internals>
