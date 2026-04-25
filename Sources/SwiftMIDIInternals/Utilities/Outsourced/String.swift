/// ----------------------------------------------
/// ----------------------------------------------
/// Extensions/Swift/String.swift
/// Extensions/Foundation/String and CharacterSet.swift
///
/// Borrowed from swift-extensions 1.4.1 under MIT license.
/// https://github.com/orchetect/swift-extensions
/// Methods herein are unit tested at their source
/// so no unit tests are necessary.
/// ----------------------------------------------
/// ----------------------------------------------

import Foundation

// ---------------------------------------------
// MARK: - Extensions/Swift/String.swift

// ---------------------------------------------

extension String {
    /// Wraps a string with double-quotes (`"`)
    @_disfavoredOverload
    public var quoted: Self {
        "\"\(self)\""
    }
}

// -------------------------------------------------------------------
// MARK: - Extensions/Foundation/String and CharacterSet.swift

// -------------------------------------------------------------------

// MARK: - Character filters

extension StringProtocol {
    /// Returns a string preserving only characters from one or more `CharacterSet`s.
    ///
    /// Example:
    ///
    ///     "A string 123".only(.alphanumerics)`
    ///     "A string 123".only(.letters, .decimalDigits)`
    ///
    @_disfavoredOverload
    public func only(
        _ characterSet: CharacterSet,
        _ characterSets: CharacterSet...
    ) -> String {
        let mergedCharacterSet = characterSets.isEmpty
            ? characterSet
            : characterSets.reduce(into: characterSet) { $0.formUnion($1) }

        return unicodeScalars
            .filter { mergedCharacterSet.contains($0) }
            .map { "\($0)" }
            .joined()
    }

    /// Returns a string preserving only characters from the passed string and removing all other
    /// characters.
    @_disfavoredOverload
    public func only(characters: String) -> String {
        only(CharacterSet(charactersIn: characters))
    }

    /// Returns a string containing only alphanumeric characters and removing all other characters.
    @_disfavoredOverload
    public var onlyAlphanumerics: String {
        only(.alphanumerics)
    }

    /// Returns a string removing all characters from the passed `CharacterSet`s.
    ///
    /// Example:
    ///
    ///     "A string 123".removing(.whitespaces)`
    ///     "A string 123".removing(.letters, .decimalDigits)`
    ///
    @_disfavoredOverload
    public func removing(
        _ characterSet: CharacterSet,
        _ characterSets: CharacterSet...
    ) -> String {
        let mergedCharacterSet = characterSets.isEmpty
            ? characterSet
            : characterSets.reduce(into: characterSet) { $0.formUnion($1) }

        return components(separatedBy: mergedCharacterSet)
            .joined()
    }

    /// Returns a string removing all characters from the passed string.
    @_disfavoredOverload
    public func removing(characters: String) -> String {
        components(separatedBy: CharacterSet(charactersIn: characters))
            .joined()
    }
}
