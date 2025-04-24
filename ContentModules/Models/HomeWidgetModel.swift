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
        searchWidget.ready()

        content = searchWidget.searchState

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
