//
//  MapContentFactory.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import SwiftUI
import MapKit

class MapContentFactory: MapContentBuilding {
    var builders: [any MapContentBuilding] = []

    func annotation(for viewState: any MapPresentableState) -> (AnyMapContent)? {
        for each in builders {
            if let result = each.annotation(for: viewState) {
                return result
            }
        }
        return nil
    }
    
}
