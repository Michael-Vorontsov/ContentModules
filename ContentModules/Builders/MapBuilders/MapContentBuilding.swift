//
//  MapBuider.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI
import MapKit

protocol MapContentBuilding {
    func annotation(for viewState: MapPresentableState) -> (any MapAnnotationProtocol)?

//    func view(for annotation: MapPresentableState) -> (any View)?
}
