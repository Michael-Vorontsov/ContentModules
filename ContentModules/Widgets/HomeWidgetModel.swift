//
//  HomeWidgetModel.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import ContentModulesPackage
import Combine

class HomeWidgetModel {
    let searchWidget: SampleSearchWidgetModel = .init()
    let exploreWidget: ExploreWidget = .init()

    let mapState = MapState(content: [])
    @Published var content: ViewState = MessageState(title: "Hello", message: "World!")
    var bag: Set<AnyCancellable> = []


    lazy var homeState: HomeState = {
        .init(mapState: self.mapState, contentState: self.content)
    }()

    init() {
        ready()
    }

    func ready() {
        defer {
            searchWidget.ready()
            exploreWidget.ready()
        }

        searchWidget
            .$feedContent
            .combineLatest(exploreWidget.$feedContent)
//            .feedContent.publisher.merge(with: exploreWidget.$feedContent)
            .map {
                var a = $0.0
                a.append(contentsOf: $0.1)
                return a
//                [$0.0, $0.1].flatMap { [$0] }
            }
//            .merge(with: exploreWidget.$feedContent)

            .sink {[unowned self] in
                homeState.contentState = TableState(content: $0)
            }
            .store(in: &bag)

        searchWidget.$actrive
            .sink {[unowned self] in
                exploreWidget.active = !$0
            }
            .store(in: &bag)
//        searchWidget.$mapContent
//            .assign(to: \.content, on: mapState)
//            .store(in: &bag)
        searchWidget.$mapContent
            .sink {[unowned self] in
                mapState.content = $0
            }
            .store(in: &bag)
    }

}
