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
    var content: [any MapPresentableState] = []

    @Published var zoomLevel: Int = 0
}


protocol MapPresentableState: ViewState {
    var id: UUID { get }
}


struct FlagMapState: MapPresentableState {
    let id = UUID()
    let coordinate: Coordinate
    var name: String
    var color: Color
}

typealias Coordinate = CLLocationCoordinate2D

struct Color {
    let hex: Int
}
