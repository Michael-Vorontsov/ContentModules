//
//  Popular.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 25/04/2025.
//

import ContentModulesPackage
import Foundation
import CoreLocation
import Combine

class PopularWidget {
    @Published var feedContent: [any TablePresentableState] = []
    @Published var mapContent: [any MapPresentableState] = []
    @Published var selectedResult: CLPlacemark?

    var bag: Set<AnyCancellable> = []

    init() {
        ready()
    }

    func ready() {
        mapContent = [
            FlagMapState(coordinate: .london, name: "london", color: .green).onSelect {[unowned self] in
                selectedResult = CLPlacemark(placemark: CLPlacemark.london)
            },
            FlagMapState(coordinate: .birmingham, name: "birmingham", color: .blue).onSelect {[unowned self] in
                selectedResult = CLPlacemark(placemark: CLPlacemark.birmingham)
            }
        ]

        feedContent = [
            MessageState(title: "Explore", message: "popular in your region"),
            AmenityState(name: "London", address: "(latitude: 51.5074, longitude: -0.1278)" ),
            AmenityState(name: "Birmingham", address: "(latitude: 52.4862, longitude: -1.8904)" ),
        ]
    }

}

private extension Coordinate {
    static let london = Coordinate(latitude: 51.5074, longitude: -0.1278)
    static let singapore = Coordinate(latitude: 1.3521, longitude: 103.8198)
    static let birmingham = Coordinate(latitude: 52.4862, longitude: -1.8904)
    static let tokyo = Coordinate(latitude: 35.6762, longitude: 139.6503)
}

import MapKit
extension CLPlacemark {

    static var london: CLPlacemark {
        let coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
        let addressDict: [String: Any] = [
            "City": "London",
            "Country": "United Kingdom",
            "CountryCode": "GB"
        ]
        return MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
    }

    static var birmingham: CLPlacemark {
        let coordinate = CLLocationCoordinate2D(latitude: 52.4862, longitude: -1.8904)
        let addressDict: [String: Any] = [
            "City": "Birmingham",
            "Country": "United Kingdom",
            "CountryCode": "GB"
        ]
        return MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
    }
}
