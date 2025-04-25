//
//  CategoriesWidget.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 25/04/2025.
//
import Combine
import ContentModulesPackage
import Foundation
import CoreLocation

class CategoriesWidget {
    @Published var feedContent: [any TablePresentableState] = []
    let searchModel = SampleSearchModel()

    private var categories = [
        "cafe",
        "shop",
        "bank",
        "landmark"
    ]

    var categoryFeeds: [String: TableState] = [:]

    func ready() {
        for each in categories {
            let categoryHeader = MessageState(title: each.capitalized, message: "")
            let catFeed = TableState(content: [
                categoryHeader,
                MessageState(title: "", message: "loading"),
            ])
            categoryFeeds[each] = catFeed
            searchModel.search(coordinate: .london, query: each) { result in
                do {
                    let results = try result.get()
                    let amenities = results.map { self.row(for: $0) }
                    catFeed.content = [categoryHeader] + amenities
                } catch {
                    catFeed.content = [
                        categoryHeader,
                        MessageState(title: "Error", message: error.localizedDescription)
                    ]
                }
            }
        }
        feedContent = [GalleryState(
            content: categoryFeeds.values.map { $0 }
        )]
    }

    func row(for placemark: CLPlacemark) -> AmenityState {
        let addressComponents = [
            placemark.thoroughfare,
            placemark.subThoroughfare,
            placemark.administrativeArea,
            placemark.postalCode
        ].compactMap { $0 }

        let addressString = addressComponents.joined(separator: ", ")

        return AmenityState(
            name: placemark.name ?? "-",
            address: addressString,
            icon: .system(name: placemark.iconName)
        )
    }
}
