![swift-midi-core](Images/swift-midi-core-banner.png)

# SwiftMIDI Core

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Forchetect%2Fswift-midi-core%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/orchetect/swift-midi-core) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Forchetect%2Fswift-midi-core%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/orchetect/swift-midi-core) [![License: MIT](http://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://github.com/orchetect/swift-midi-core/blob/main/LICENSE)

MIDI events and value types for [SwiftMIDI](https://github.com/orchetect/swift-midi) supporting MIDI 1.0 and MIDI 2.0.

## Compatibility

| macOS | iOS  | visionOS | Linux | Android | Windows |
| :---: | :--: | :------: | :---: | :-----: | :-----: |
|   🟢   |  🟢   |    🟢     |  🚧 †  |   🚧 †   |    -    |

`†` Support for indicated platforms is either planned or WIP.

## Getting Started

This extension is available as a Swift Package Manager (SPM) package.

To use this extension as standalone dependency (instead of importing the **swift-midi** umbrella repository):

1. Add the **swift-midi-core** repo as a dependency.

   ```swift
   .package(url: "https://github.com/orchetect/swift-midi-core", from: "1.0.0")
   ```

2. Add **SwiftMIDICore** to your target.

   ```swift
   .product(name: "SwiftMIDICore", package: "swift-midi-core")
   ```

3. Import **SwiftMIDICore** to use it.

   ```swift
   import SwiftMIDICore
   ```

## Documentation & Support

See the [online documentation](https://swiftpackageindex.com/orchetect/swift-midi-core/main/documentation) for this repository and the dedicated [code examples](https://github.com/orchetect/swift-midi-examples) repository.

For support, feature requests, and bug reports see the main [SwiftMIDI](https://github.com/orchetect/swift-midi) repository.

## Author

Coded by a bunch of 🐹 hamsters in a trenchcoat that calls itself [@orchetect](https://github.com/orchetect).

## License

Licensed under the MIT license. See [LICENSE](https://github.com/orchetect/swift-midi-core/blob/master/LICENSE) for details.