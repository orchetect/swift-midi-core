//
//  NoteAttribute Pitch7_9.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent.NoteAttribute {
    /// Pitch 7.9 Note Attribute
    /// (MIDI 2.0)
    ///
    /// A Q7.9 fixed-point unsigned integer that specifies a pitch in semitones.
    ///
    /// Range: `0 ... 127 + (511/512)`
    public struct Pitch7_9 {
        /// 7-Bit coarse pitch in semitones, based on default Note Number equal temperament scale.
        public var coarse: UInt7

        /// 9-Bit fractional pitch above Note Number (i.e., fraction of one semitone).
        public var fine: UInt9

        /// Pitch 7.9 Note Attribute
        /// (MIDI 2.0)
        ///
        /// A Q7.9 fixed-point unsigned integer that specifies a pitch in semitones.
        ///
        /// Range: `0 ... 127 + (511/512)`
        ///
        /// - Parameters:
        ///   - coarse: 7-Bit coarse pitch in semitones, based on default Note Number equal
        ///     temperament scale.
        ///   - fine: 9-Bit fractional pitch above Note Number (i.e., fraction of one semitone).
        public init(
            coarse: UInt7,
            fine: UInt9
        ) {
            self.coarse = coarse
            self.fine = fine
        }
    }
}

extension MIDIEvent.NoteAttribute.Pitch7_9: Equatable { }

extension MIDIEvent.NoteAttribute.Pitch7_9: Hashable { }

extension MIDIEvent.NoteAttribute.Pitch7_9: Sendable { }

extension MIDIEvent.NoteAttribute.Pitch7_9: CustomStringConvertible {
    public var description: String {
        "pitch7.9(\(coarse), fine:\(fine))"
    }
}

// MARK: - BytePair

extension MIDIEvent.NoteAttribute.Pitch7_9 {
    /// Pitch 7.9 (MIDI 2.0):
    /// Initialize from `UInt16` representation as a byte pair.
    ///
    /// A Q7.9 fixed-point unsigned integer that specifies a pitch in semitones.
    ///
    /// Range: `0 ... 127 + (511/512)`
    public init(_ bytePair: BytePair) {
        coarse = UInt7((bytePair.msb & 0b11111110) >> 1)

        fine = UInt9(
            UInt9.Storage(bytePair.lsb)
                + (UInt9.Storage(bytePair.msb & 0b1) << 8)
        )
    }

    /// `UInt16` representation as a byte pair.
    @inlinable
    public var bytePair: BytePair {
        let msb = UInt8(coarse.uInt8Value << 1)
            + UInt8((fine.uInt16Value & 0b1_00000000) >> 8)
        let lsb = UInt8(fine.uInt16Value & 0b11111111)

        return .init(msb: msb, lsb: lsb)
    }
}

// MARK: - UInt16

extension MIDIEvent.NoteAttribute.Pitch7_9 {
    /// Pitch 7.9 (MIDI 2.0):
    /// Initialize from `UInt16` representation.
    ///
    /// A Q7.9 fixed-point unsigned integer that specifies a pitch in semitones.
    ///
    /// Range: `0 ... 127 + (511/512)`
    public init(_ uInt16Value: UInt16) {
        coarse = ((uInt16Value & 0b11111110_00000000) >> 9).toUInt7
        fine = (uInt16Value & 0b00000001_11111111).toUInt9
    }

    /// `UInt16` representation.
    @inlinable
    public var uInt16Value: UInt16 {
        (UInt16(coarse.uInt8Value) << 9) + fine.uInt16Value
    }
}

// MARK: - Double

extension MIDIEvent.NoteAttribute.Pitch7_9 {
    /// Pitch 7.9 (MIDI 2.0):
    /// Initialize by converting from a Double value
    /// (`0.0 ..< 128.0` which is in effect `0.0 ... 127.998046875`)
    ///
    /// A Q7.9 fixed-point unsigned integer that specifies a pitch in semitones.
    ///
    /// Range: `0 ... 127 + (511/512)`
    public init(_ double: Double) {
        // Clamp to representable range
        let clamped = double.clamped(to: 0.0 ... 127.998046875)

        // Integer part: 0 ... 127, truncate toward zero
        let coarseDouble = clamped.rounded(.towardZero)

        // Fractional part in 0 ... 1
        let fractional = clamped - coarseDouble

        // Scale fractional part to 9-bit range (0 ... 511) and round to nearest
        let fineDouble = (fractional * 512).rounded()  // 0b10_00000000 == 512

        // Clamp to 0...511 to avoid +1 overflow if rounded hits 512
        let fineClamped = fineDouble.clamped(to: 0.0 ... 511.0)

        coarse = UInt7(coarseDouble)
        fine = UInt9(fineClamped)
    }

    /// Converted to a `Double` value.
    /// (`0.0 ..< 128.0` which is in effect `0.0 ... 127.998046875`)
    @inlinable
    public var doubleValue: Double {
        Double(coarse.uInt8Value) + (Double(fine.uInt16Value) / 0b10_00000000)
    }
}
