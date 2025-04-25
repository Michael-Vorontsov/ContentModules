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
    @Published var coordinate: Coordinate = .london
    private let galleryContent = GalleryState(content: [])
    let searchModel = SampleSearchModel()
    var bag: Set<AnyCancellable> = []

    private var categories = [
        "cafe",
        "shop",
        "bank",
        "landmark"
    ]

    var categoryFeeds: [String: TableState] = [:]

    func loadCategories(for coordinate: Coordinate) {
        for each in categories {
            let categoryHeader = MessageState(title: each.capitalized, message: "")
            let catFeed = TableState(content: [
                categoryHeader,
                MessageState(title: "", message: "loading"),
            ])
            categoryFeeds[each] = catFeed
            searchModel.search(coordinate: coordinate, query: each) { result in
                do {
                    let results = try result.get().shuffled().first(5)
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
        galleryContent.content = categoryFeeds.values.map { $0 }
    }

    func ready() {
        $coordinate
            .sink {[unowned self] in
                loadCategories(for: $0)
            }
            .store(in: &bag)

        feedContent = [galleryContent]
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

extension Array {
    func first(_ n: Int) -> [Element] {
        return Array(self.prefix(n))
    }
}

