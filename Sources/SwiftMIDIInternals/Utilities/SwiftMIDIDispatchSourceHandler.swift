import Dispatch
import Foundation

#if canImport(Darwin)
    // Darwin libdispatch exposes the nested typealias
    // DispatchSourceProtocol.DispatchSourceHandler = () -> Void
    public typealias SwiftMIDIDispatchSourceHandler = DispatchSourceProtocol.DispatchSourceHandler
#else
    // On Linux, just use the underlying closure type
    public typealias SwiftMIDIDispatchSourceHandler = () -> Void
#endif
