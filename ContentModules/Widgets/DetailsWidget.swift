//
//  DetialsWidget.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import CoreLocation
import Foundation
import ContentModulesPackage

class DetailsWidget: ObservableObject {
    @Published var feedContent: [any TablePresentableState] = []
    @Published var mapContent: [any MapPresentableState] = []

    let categoryWidget = CategoriesWidget()

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
                        ImageState(.system(name: selectedPlacemark.iconName)),
                        CloseButtonState { [unowned self] in
                            onClose?()
                        }
                    ]
                ),
                AmenityState(name: selectedPlacemark.name ?? "", address: selectedPlacemark.address),
            ]
            if let pois = selectedPlacemark.areasOfInterest, pois.count > 0 {
                feedContent.append( MessageState(title: "PoI", message: pois.joined(separator: ", ")))
            }

            if selectedPlacemark.thoroughfare == nil, let location = selectedPlacemark.location?.coordinate {
                categoryWidget.ready()
                categoryWidget.coordinate = Coordinate(latitude: location.latitude, longitude: location.longitude)
                feedContent.append(contentsOf:  categoryWidget.feedContent)
            }

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
