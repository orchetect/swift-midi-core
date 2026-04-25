//
//  Utilities.swift
//  swift-midi-core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation

extension FileManager {
    // `FileManager` is thread-safe but doesn't yet conform to Sendable,
    // so we can coerce it to be treated as Sendable.
    private static func getDefaultFileManager() -> @Sendable () -> FileManager {
        { Self.default }
    }

    public static var sendableDefault: FileManager {
        getDefaultFileManager()()
    }
}

/// Zips two collections, padding the shorter collection with `nil` in order to fit the larger collection if necessary.
public func optionalZip<C1: Collection<E1>, E1, C2: Collection<E2>, E2>(
    _ collection1: C1,
    _ collection2: C2
) -> [(E1?, E2?)] {
    var output: [(E1?, E2?)] = []
    var commonIndex: Int = 0

    func c1HasRemainder() -> Bool {
        commonIndex < collection1.count
    }
    func c1Index() -> C1.Index? {
        guard c1HasRemainder() else { return nil }
        return collection1.index(collection1.startIndex, offsetBy: commonIndex)
    }

    func c2HasRemainder() -> Bool {
        commonIndex < collection2.count
    }
    func c2Index() -> C2.Index? {
        guard c2HasRemainder() else { return nil }
        return collection2.index(collection2.startIndex, offsetBy: commonIndex)
    }

    while c1HasRemainder() || c2HasRemainder() {
        let element1: E1? = if let index = c1Index() { collection1[index] } else { nil }
        let element2: E2? = if let index = c2Index() { collection2[index] } else { nil }
        output += [(element1, element2)]
        commonIndex += 1
    }
    return output
}
