//
//  Exception.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation

/// Exception types.
public enum Exception {
    case overflow
    case underflow
    case divisionByZero
}

extension Exception {
    /// Description of the reason for the exception.
    @inlinable
    public var reason: String {
        switch self {
        case .overflow:
            "Number overflow."
        case .underflow:
            "Number underflow."
        case .divisionByZero:
            "Division by zero."
        }
    }

    /// Raises the exception.
    /// On Apple platforms, this raises an Objective-C exception.
    /// On non-Apple platforms, this calls `fatalError`.
    @inlinable
    public func raise(reason customReason: String? = nil) {
        let reasonString = customReason ?? reason
        
        #if canImport(ObjectiveC)
            // raise an Objective-C exception
            let name: NSExceptionName = switch self {
            case .overflow: .decimalNumberOverflowException
            case .underflow: .decimalNumberUnderflowException
            case .divisionByZero: .decimalNumberDivideByZeroException
            }

            let exception = NSException(name: name, reason: reasonString, userInfo: nil)
            exception.raise()
        #else
            // fall back to fatal error
            fatalError(reasonString)
        #endif
    }
}
