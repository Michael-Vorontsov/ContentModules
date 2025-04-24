//
//  MapBuider.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI
import MapKit

public protocol MapContentBuilding {
    @MainActor func annotation(for viewState: any MapPresentableState) -> (AnyMapContent)?

//    func view(for annotation: MapPresentableState) -> (any View)?
}
