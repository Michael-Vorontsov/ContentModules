//
//  MapState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//
import Combine
import Foundation
import CoreLocation

public final class MapState: ObservableObject, ViewState {
    public  init(content: [any MapPresentableState] = [], zoomLevel: Int = 0) {
        self.content = content
        self.zoomLevel = zoomLevel
    }
    
    @Published public var content: [any MapPresentableState] = []

    @Published public var zoomLevel: Int = 0
    @Published public var selected: (any MapPresentableState)?
}


public protocol MapPresentableState: Hashable, ViewState, Identifiable {
    var id: UUID { get }
}

public typealias Coordinate = CLLocationCoordinate2D

extension Coordinate: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

public struct Color: Hashable {
    public init(hex: Int) {
        self.hex = hex
    }
    
    public let hex: Int
}

public extension Color {
    static var black: Color {
        .init(hex: 0xFFFFFF)
    }

    static var red: Color {
        .init(hex: 0xFF0000)
    }

    static var green : Color {
        .init(hex: 0x00FF00)
    }

    static var blue: Color {
        .init(hex: 0x0000FF)
    }
}
