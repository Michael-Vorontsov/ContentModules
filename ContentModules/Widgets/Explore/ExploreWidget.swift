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

extension Array {

    static func + (lhs: Self, rhs: Self) -> Self {
        var newArray = lhs
        newArray.append(contentsOf: rhs)
        return newArray
    }


    func appending(contentOf array: Self) -> Self {
        self + array
    }
}

class ExploreWidget {

    enum ContentMode {
        case search
        case defaultContent
    }

    @Published var feedContent: [any TablePresentableState] = []
    @Published var mapContent: [any MapPresentableState] = []
    @Published var selectedResult: CLPlacemark?

    let searchWidget = SampleSearchWidgetModel()
    let popularWidget = PopularWidget()
    let categoriesWidget = CategoriesWidget()

    var mode: ContentMode = .defaultContent {
        didSet {
            switch mode {
            case .defaultContent:
                prepareDefaultContent()
            case .search:
                prepareSearchContent()
            }
        }
    }

    var bag: Set<AnyCancellable> = []
    var feedBag: Set<AnyCancellable> = []

    func prepareDefaultContent() {
        feedBag.removeAll()
        searchWidget.$feedContent
            .combineLatest(popularWidget.$feedContent) { $0 + $1}
            .combineLatest(categoriesWidget.$feedContent) { $0 + $1 }
            .assign(to: \.feedContent, on: self)
            .store(in: &feedBag)

        searchWidget.$mapContent
            .combineLatest(popularWidget.$mapContent){ $0 + $1}
            .assign(to: \.mapContent, on: self)
            .store(in: &feedBag)
    }

    func prepareSearchContent() {
        feedBag.removeAll()
        searchWidget.$feedContent
            .sink { [unowned self] in
                self.feedContent = $0
            }
          .store(in: &feedBag)

        searchWidget.$mapContent
            .sink { [unowned self] in
                self.mapContent = $0
            }
            .store(in: &feedBag)
    }

    func ready() {
        categoriesWidget.ready()

        searchWidget.$actrive
            .dropFirst()
            .sink { [unowned self] in
                if $0 {
                    mode = .search
                } else {
                    mode = .defaultContent
                }
            }
            .store(in: &bag)

        searchWidget.$selectedResult
            .merge(with: popularWidget.$selectedResult)
            .assign(to: \.selectedResult, on: self)
            .store(in: &bag)
    }

}

//private extension Coordinate {
//    static let london = Coordinate(latitude: 51.5074, longitude: -0.1278)
//    static let singapore = Coordinate(latitude: 1.3521, longitude: 103.8198)
//    static let birmingham = Coordinate(latitude: 52.4862, longitude: -1.8904)
//    static let tokyo = Coordinate(latitude: 35.6762, longitude: 139.6503)
//}
