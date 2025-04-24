//
//  FlagBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI
import MapKit

public class FlagBuilder: MapContentBuilding {
    public func annotation(for viewState: any MapPresentableState) -> (AnyMapContent)? {
        guard let state = viewState as? FlagMapState else { return nil }

        return AnyMapContent(
            Marker(coordinate: state.coordinate) {
                Text(state.name)
            }
            .tint(SwiftUI.Color(state.color))
        )
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

#Preview {
    let view = MapBuilder(
        contentBuilder: FlagBuilder()
    )
        .view(
            for: MapState(
                content: [
                    FlagMapState(
                        coordinate: Coordinate.london,
                        name: "London",
                        color: .init(hex: 0x0000ff)
                    ),
                    FlagMapState(
                        coordinate: Coordinate.birmingham,
                        name: "birmingham",
                        color: .init(hex: 0xff00f0)
                    )

                ]
            )
        ) ?? EmptyView()
    view
}
