//
//  FlagBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI
import MapKit

class FlagBuilder: MapContentBuilding {
    func annotation(for viewState: any MapPresentableState) -> (any MapAnnotationProtocol)? {
        guard let state = viewState as? FlagMapState else { return nil }

        return MapMarker(coordinate: state.coordinate, tint: SwiftUI.Color(state.color))
    }
    
    
}


extension SwiftUI.Color {
    init(_ color: Color) {
        let hex = color.hex
        let red   = Double((hex >> 16) & 0xFF) / 0xFF
        let green = Double((hex >> 8) & 0xFF) /  0xFF
        let blue  = Double(hex & 0xFF) /  0xFF

        self.init(red: red, green: green, blue: blue)
    }
}
