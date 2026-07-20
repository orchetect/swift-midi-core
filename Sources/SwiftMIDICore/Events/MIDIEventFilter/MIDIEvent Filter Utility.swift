//
//  MIDIEvent Filter Utility.swift
//  SwiftMIDI Core • https://github.com/orchetect/swift-midi-core
//  © 2026 Steffan Andrews • Licensed under MIT License
//

// MARK: - Metadata properties

extension MIDIEvent {
    /// Returns `true` if the event is a Utility message.
    public var isUtility: Bool {
        eventType.isUtility
    }

    /// Returns `true` if the event is a Utility message of a specific type.
    public func isUtility(ofType utilityType: MIDIEventType.Utility) -> Bool {
        eventType == .utility(utilityType)
    }

    /// Returns `true` if the event is a Utility message of a specific type.
    public func isUtility(ofTypes utilityTypes: Set<MIDIEventType.Utility>) -> Bool {
        for eventType in utilityTypes {
            if isUtility(ofType: eventType) { return true }
        }

        return false
    }
}

// MARK: - Filter

extension Collection<MIDIEvent> {
    /// Filter Utility events.
    public func filter(utility types: MIDIEventFilter.Utility) -> [Element] {
        switch types {
        case .only:
            filter(\.isUtility)

        case let .onlyType(specificType):
            filter { $0.isUtility(ofType: specificType) }

        case let .onlyTypes(specificTypes):
            filter { $0.isUtility(ofTypes: specificTypes) }

        case let .keepType(specificType):
            filter {
                guard $0.isUtility else { return true }
                return $0.isUtility(ofType: specificType)
            }

        case let .keepTypes(specificTypes):
            filter {
                guard $0.isUtility else { return true }
                return $0.isUtility(ofTypes: specificTypes)
            }

        case .drop:
            filter { !$0.isUtility }

        case let .dropType(specificType):
            filter {
                guard $0.isUtility else { return true }
                return !$0.isUtility(ofType: specificType)
            }

        case let .dropTypes(specificTypes):
            filter {
                guard $0.isUtility else { return true }
                return !$0.isUtility(ofTypes: specificTypes)
            }
        }
    }
}
