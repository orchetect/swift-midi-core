//
//  CC Controller Operators.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

extension MIDIEvent.CC.Controller {
    public static func == (lhs: Self, rhs: some BinaryInteger) -> Bool {
        lhs.number == rhs
    }

    public static func != (lhs: Self, rhs: some BinaryInteger) -> Bool {
        lhs.number != rhs
    }

    public static func == (lhs: some BinaryInteger, rhs: Self) -> Bool {
        lhs == rhs.number
    }

    public static func != (lhs: some BinaryInteger, rhs: Self) -> Bool {
        lhs != rhs.number
    }
}
