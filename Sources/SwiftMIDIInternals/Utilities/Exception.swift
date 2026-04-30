//
//  Exception.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation

/// Pre-formed `NSException` cases.
public enum Exception {
    case overflow
    case underflow
    case divisionByZero
}

extension Exception {
    @inlinable
    public func raise(reason: String? = nil) {
        #if canImport(ObjectiveC)
            let name: NSExceptionName =
                switch self {
                case .overflow:
                    .decimalNumberOverflowException

                case .underflow:
                    .decimalNumberUnderflowException

                case .divisionByZero:
                    .decimalNumberDivideByZeroException
                }

            let exception = NSException(name: name, reason: reason, userInfo: nil)
            exception.raise()
        #else
            switch self {
            case .overflow:
                fatalError(reason ?? "Decimal number overflow")
            case .underflow:
                fatalError(reason ?? "Decimal number underflow")
            case .divisionByZero:
                fatalError(reason ?? "Decimal number division by zero")
            }
        #endif
    }
}
