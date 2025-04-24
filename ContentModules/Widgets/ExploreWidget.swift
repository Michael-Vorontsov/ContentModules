//
//  ExploreWidget.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import ContentModulesPackage
import Foundation
import CoreLocation
import Combine

class ExploreWidget {
    @Published var feedContent: [any TablePresentableState] = []
    @Published var mapContent: [any MapPresentableState] = []

    @Published var active: Bool = true
    var bag: Set<AnyCancellable> = []

    func ready() {
        $active
            .removeDuplicates()
            .sink { [unowned self] in
                guard $0 else {
                    mapContent = []
                    feedContent = []
                    return
                }

                mapContent = [
                    FlagMapState(coordinate: .london, name: "london", color: .green),
                    FlagMapState(coordinate: .birmingham, name: "birmingham", color: .blue),
                ]

                feedContent = [
                    MessageState(title: "Explore", message: "popular in your region"),
                    AmenityState(name: "London", address: "(latitude: 51.5074, longitude: -0.1278)" ),
                    AmenityState(name: "Birmingham", address: "(latitude: 52.4862, longitude: -1.8904)" ),
                ]
            }
            .store(in: &bag)
    }

}

private extension Coordinate {
    static let london = Coordinate(latitude: 51.5074, longitude: -0.1278)
    static let singapore = Coordinate(latitude: 1.3521, longitude: 103.8198)
    static let birmingham = Coordinate(latitude: 52.4862, longitude: -1.8904)
    static let tokyo = Coordinate(latitude: 35.6762, longitude: 139.6503)
}
