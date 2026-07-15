//
//  DispatchQueue Extensions.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import class Foundation.DispatchQueue

extension DispatchQueue {
    /// Wrapper for `sync { }` that allows the use of typed error throws.
    public func syncTypedThrowable<T, E: Error>(execute work: () throws(E) -> T) throws(E) -> T {
        do {
            return try sync(execute: work)
        } catch let error as E {
            throw error
        } catch {
            fatalError("Should never happen.")
        }
    }
}
