//
//  FlagMapState.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 24/04/2025.
//
import Foundation

public struct FlagMapState: MapPresentableState {
    public init(coordinate: Coordinate, name: String, color: Color) {
        self.coordinate = coordinate
        self.name = name
        self.color = color
    }

    public let id = UUID()
    public let coordinate: Coordinate
    public let name: String
    public let color: Color
}

public struct SelectableViewState<Content: MapPresentableState>: MapPresentableState, Selectable {
    public var id: UUID { content.id }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.content.id == rhs.content.id
    }

    public func hash(into hasher: inout Hasher) {
        content.hash(into: &hasher)
    }

    let content: Content
    let didSelect: () -> Void
}

public extension MapPresentableState {
    func onSelect(_ handler: @escaping () -> Void) -> SelectableViewState<Self> {
        SelectableViewState(content: self, didSelect: handler)
    }
}


protocol Selectable: Identifiable {
    var didSelect: () -> Void { get }
}
