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
    @Published var feedContent: [any TablePresentableState] = []
    @Published var mapContent: [any MapPresentableState] = []

    var onClose: (() -> Void)?

    var selectedPlacemark: CLPlacemark? {
        didSet {
            guard let selectedPlacemark else {
                feedContent = []
                mapContent = []
                return
            }

            feedContent = [
                ZStackState(
                    content: [
                        AmenityState(name: selectedPlacemark.name ?? "", address: selectedPlacemark.address),
                        CloseButtonState { [unowned self] in
                            onClose?()
                        }
                    ]
                ),
                MessageState(title: "PoI", message: selectedPlacemark.areasOfInterest?.joined(separator: ", ") ?? "none" ),
                
                ImageState(.remote(url: selectedPlacemark.iconURL))
            ]

            if let coordinate = selectedPlacemark.location?.coordinate{
                mapContent = [
                    FlagMapState(coordinate: coordinate, name: selectedPlacemark.name ?? "", color: .red)
                ]
            }

        }
    }

}

extension CLPlacemark {
    var address: String {
        (thoroughfare ?? "") + (subThoroughfare ?? "") + (locality ?? "") + (postalCode ?? "")
    }
}
