//
//  MapBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI
import MapKit

public final class MapBuilder: UIBuilder {
    public init(contentBuilder: any MapContentBuilding) {
        self.contentBuilder = contentBuilder
    }
    
    public let contentBuilder: MapContentBuilding


    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? MapState else { return nil }

        return MapView(contentBuilder: contentBuilder, state: state)
    }

}

//public struct AnyMapAnnotation: Identifiable {
//
//    var id: UUID { content.id }
//    let content: any MapPresentableState
//
//}


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
                        coordinate: Coordinate.tokyo,
                        name: "Tokyo",
                        color: .init(hex: 0xff00f0)
                    )

                ]
            )
        ) ?? EmptyView()
    view
}

extension Coordinate {
    static let london = Coordinate(latitude: 51.5074, longitude: -0.1278)
    static let singapore = Coordinate(latitude: 1.3521, longitude: 103.8198)
    static let birmingham = Coordinate(latitude: 52.4862, longitude: -1.8904)
    static let tokyo = Coordinate(latitude: 35.6762, longitude: 139.6503)
}
