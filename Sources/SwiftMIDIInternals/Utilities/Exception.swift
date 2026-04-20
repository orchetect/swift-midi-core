//
//  Exception.swift
//  MIDIKit • https://github.com/orchetect/MIDIKit
//  © 2021-2025 Steffan Andrews • Licensed under MIT License
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
        switch self {
        case .overflow:
            Self.raiseException(.decimalNumberOverflowException, reason: reason)
    
        case .underflow:
            Self.raiseException(.decimalNumberUnderflowException, reason: reason)
    
        case .divisionByZero:
            Self.raiseException(.decimalNumberDivideByZeroException, reason: reason)
        }
    }
    
    /// Raises an `NSException`
    @usableFromInline
    static func raiseException(
        _ exceptionName: NSExceptionName,
        reason: String? = nil
    ) {
        let exception = NSException(name: exceptionName, reason: reason, userInfo: nil)
        exception.raise()
    }
}
