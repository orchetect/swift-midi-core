//
//  MIDIEvent Errors.swift
//  swift-midi • https://github.com/orchetect/swift-midi
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation

extension MIDIEvent {
    public enum ParseError: LocalizedError {
        case rawBytesEmpty
        case malformed
        case invalidType
    }
}

extension MIDIEvent.ParseError {
    public var errorDescription: String? {
        switch self {
        case .rawBytesEmpty:
            "Raw bytes empty."
        case .malformed:
            "Malformed."
        case .invalidType:
            "Invalid type."
        }
    }
}
