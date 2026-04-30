//
//  Utilities.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews + contributors • Licensed under MIT License
//

import CoreFoundation
import Foundation

enum ICUTransform: String {
    case latinASCII = "Latin-ASCII"
}

enum TextTransform {
    @inline(__always)
    private static func makeCFMutableString(_ source: String) -> CFMutableString {
        let ns = NSMutableString(string: source)
        return unsafeBitCast(ns, to: CFMutableString.self)
    }

    @inline(__always)
    private static func makeCFString(_ source: String) -> CFString {
        let ns = source as NSString
        return unsafeBitCast(ns, to: CFString.self)
    }

    @inline(__always)
    private static func makeString(_ source: CFMutableString) -> String {
        let ns = unsafeBitCast(source, to: NSMutableString.self)
        return ns as String
    }

    static func apply(
        _ transform: ICUTransform,
        to source: String,
        reverse: Bool = false
    ) -> String? {
        let mutable = makeCFMutableString(source)
        let success = CFStringTransform(
            mutable,
            nil,
            makeCFString(transform.rawValue),
            reverse
        )
        guard success else { return nil }
        return makeString(mutable)
    }

    static func latinToASCII(_ source: String) -> String? {
        apply(.latinASCII, to: source)
    }
}
