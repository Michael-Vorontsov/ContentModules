//
//  MapBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI
import MapKit

//final class MapBuilder: UIBuilder {
//    internal init(contentBuilder: any MapContentBuilding) {
//        self.contentBuilder = contentBuilder
//    }
//    
//    let contentBuilder: MapContentBuilding
//    @State var region: MKCoordinateRegion
//
//    func view(for viewState: any ViewState) -> (any View)? {
//        guard let state = viewState as? MapState else { return nil }
//
//        let erasedAnnotations =  state.content.map { AnyMapAnnotation(content: $0) }
//        let annotations =  state.content.map { contentBuilder.annotation(for: $0) }
//
//        return Map(
//            coordinateRegion: $region,
//            annotationItems: erasedAnnotations,
//            annotationContent: { [contentBuilder] state in
//                let view = contentBuilder.annotation(for: state.content) ?? EmptyView()
//                return AnyView(view)
//            }
//        )
//    }
//
//}
//
//struct AnyMapAnnotation: Identifiable {
//    var id: UUID { content.id }
//    let content: any MapPresentableState
//
//}
//
//
//
