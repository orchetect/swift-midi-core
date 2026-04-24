# Getting Started

Basics for becoming familiar with MIDI events and value types used in SwiftMIDI.

![swift-midi-core](swift-midi-core-banner.png)

This is a basic guide intended to help introduce the contents of this package.

## Table of Contents

- [Learn how SwiftMIDI Value Types Work](#Learn-how-SwiftMIDI-Value-Types-Work)
- [Constructing Events](#Constructing-Events)
- [Filtering Events](#Filtering-Events)
- [Additional Types](#Additional-Types)
- [Examples](#Examples)

## Learn how SwiftMIDI Value Types Work

SwiftMIDI was built to use smart hybrid MIDI event value types, simplifying the learning curve to adopting MIDI 2.0 and allowing for a form of value type-erasure.

This results in the ability to use MIDI 1.0 values, MIDI 2.0 values, unit intervals or any combination of those seamlessly regardless whether your platform supports MIDI 1.0 or MIDI 2.0 or whether you choose to use MIDI 2.0 values or not.

Learn how SwiftMIDI's <doc:Value-Types> work.

## Constructing Events

- Learn how to construct ``MIDIEvent``s.

## Filtering Events

- Learn about powerful <doc:Event-Filters>.

## Additional Types

SwiftMIDI contains additional objects and value types.

- term ``MIDINote``: Struct representing a MIDI note with constructors and getters for note number, note name (ie: `"A#-1"`), and frequency in Hz and other metadata. This can be useful for generating UI labels with note names or calculating frequency for synthesis.
- term ``MIDIEventFilterGroup``: Struct allowing the configuration of zero or more MIDI event filters in series, capable of applying the filters to arrays of MIDI events.

## Examples

See the [example projects](https://github.com/orchetect/swift-midi-examples) for demonstration of best practises in using SwiftMIDI.
