//
//  MapState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//
import Combine
import Foundation
import CoreLocation

final class MapState: ViewState {
    internal init(content: [any MapPresentableState] = [], zoomLevel: Int = 0) {
        self.content = content
        self.zoomLevel = zoomLevel
    }
    
    var content: [any MapPresentableState] = []

    @Published var zoomLevel: Int = 0
}


protocol MapPresentableState: Hashable, ViewState, Identifiable {
    var id: UUID { get }
}


struct FlagMapState: MapPresentableState {
    let id = UUID()
    let coordinate: Coordinate
    var name: String
    var color: Color
}

typealias Coordinate = CLLocationCoordinate2D

extension Coordinate: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

struct Color: Hashable {
    let hex: Int
}
