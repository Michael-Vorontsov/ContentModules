//
//  MapView.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import SwiftUI
import MapKit
import Combine

struct MapView: View {
    let contentBuilder: MapContentBuilding
    @ObservedObject var state: MapState
    @State var selected: UUID?

    var body: some View {
        Map (selection: $selected) {
            ForEach(state.content, id:\.id) { item in
                self.contentBuilder.annotation(for: item)
                    .tag(item.id)

            }
        }
        .onChange(of: selected) { oldValue, newValue in
            let selectedContent = state.content.first {
                $0.id == newValue
            }
            if let selectedContent {
                print(selectedContent)
            }

            if let selectable = selectedContent as? any Selectable {
                selectable.didSelect()
            }
            
            state.selected = selectedContent
        }
    }

}

#Preview {
    MapView(
        contentBuilder: FlagBuilder(),
        state: MapState(
            content: [
                FlagMapState(
                    coordinate: Coordinate.tokyo,
                    name: "Tokyo",
                    color: .init(hex: 0x0000ff)
                ),
                FlagMapState(
                    coordinate: Coordinate.singapore,
                    name: "Singapore",
                    color: .init(hex: 0xff00f0)
                )
            ]
        )
    )
}
