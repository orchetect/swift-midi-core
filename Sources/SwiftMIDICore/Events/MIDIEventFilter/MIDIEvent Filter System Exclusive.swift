//
//  MIDIEvent Filter System Exclusive.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

// MARK: - Metadata properties

extension MIDIEvent {
    /// Returns `true` if the event is a System Exclusive message.
    public var isSystemExclusive: Bool {
        eventType.isSystemExclusive
    }

    /// Returns `true` if the event is a System Exclusive message of a specific type.
    public func isSystemExclusive(ofType sysExType: MIDIEventType.SystemExclusive) -> Bool {
        eventType == .systemExclusive(sysExType)
    }

    /// Returns `true` if the event is a System Exclusive message of a specific type.
    public func isSystemExclusive(ofTypes sysExTypes: Set<MIDIEventType.SystemExclusive>) -> Bool {
        for eventType in sysExTypes {
            if isSystemExclusive(ofType: eventType) { return true }
        }

        return false
    }
}

// MARK: - Filter

extension Collection<MIDIEvent> {
    /// Filter System Exclusive events.
    public func filter(sysEx types: MIDIEventFilter.SystemExclusive) -> [Element] {
        switch types {
        case .only:
            filter(\.isSystemExclusive)

        case let .onlyType(specificType):
            filter { $0.isSystemExclusive(ofType: specificType) }

        case let .onlyTypes(specificTypes):
            filter { $0.isSystemExclusive(ofTypes: specificTypes) }

        case let .keepType(specificType):
            filter {
                guard $0.isSystemExclusive else { return true }
                return $0.isSystemExclusive(ofType: specificType)
            }

        case let .keepTypes(specificTypes):
            filter {
                guard $0.isSystemExclusive else { return true }
                return $0.isSystemExclusive(ofTypes: specificTypes)
            }

        case .drop:
            filter { !$0.isSystemExclusive }

        case let .dropType(specificType):
            filter {
                guard $0.isSystemExclusive else { return true }
                return !$0.isSystemExclusive(ofType: specificType)
            }

        case let .dropTypes(specificTypes):
            filter {
                guard $0.isSystemExclusive else { return true }
                return !$0.isSystemExclusive(ofTypes: specificTypes)
            }
        }
    }
}
