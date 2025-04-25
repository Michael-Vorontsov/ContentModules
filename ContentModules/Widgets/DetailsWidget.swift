//
//  DetialsWidget.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import CoreLocation
import Foundation
import ContentModulesPackage

class DetailsWidget {
    @Published var feed: [any TablePresentableState] = []
    @Published var isActive: Bool = false

    var selectedPlacemark: CLPlacemark? {
        didSet {
            guard let selectedPlacemark else {
                feed = []
                isActive = false
                return
            }

            isActive = true
            feed = [
                AmenityState(name: selectedPlacemark.name ?? "", address: selectedPlacemark.address),
                MessageState(title: "PoI", message: selectedPlacemark.areasOfInterest?.joined(separator: ", ") ?? "none" ),
                ImageState(url: selectedPlacemark.iconURL)
            ]
        }
    }

}

extension CLPlacemark {
    var address: String {
        (thoroughfare ?? "") + (subThoroughfare ?? "") + (locality ?? "") + (postalCode ?? "")
    }
}
