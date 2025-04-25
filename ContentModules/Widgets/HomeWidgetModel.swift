//
//  HomeWidgetModel.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import ContentModulesPackage
import Combine

class HomeWidgetModel {

    enum ContentMode {
        case explore
        case details
    }

    var mode: ContentMode = .explore {
        didSet {
            switch mode {
            case .details:
                prepDetails()
            case .explore:
                prepExplore()
            }
        }
    }

    let exploreWidget = ExploreWidget()
    let detailsWidget = DetailsWidget()

    let mapState = MapState(content: [])
    
    @Published var content: ViewState = MessageState(title: "Hello", message: "World!")
    

    var bag: Set<AnyCancellable> = []
    var contentBag: Set<AnyCancellable> = []


    lazy var homeState: HomeState = {
        .init(mapState: self.mapState, contentState: self.content)
    }()

    init() {
        ready()
    }

    func prepExplore() {
        contentBag.removeAll()
        exploreWidget.$feedContent
            .sink {[unowned self] in
                homeState.contentState = TableState(content: $0)
            }
            .store(in: &contentBag)

        exploreWidget.$mapContent
            .sink {[unowned self] in
                mapState.content = $0
            }
            .store(in: &contentBag)

        exploreWidget
            .$selectedResult
            .dropFirst()
            .compactMap { $0 }
            .sink {[unowned self] in
                detailsWidget.selectedPlacemark = $0
                self.mode = .details
            }
            .store(in: &contentBag)
    }

    func prepDetails() {
        contentBag.removeAll()

        detailsWidget.$feedContent
            .sink {[unowned self] in
                homeState.contentState = TableState(content: $0)
            }
            .store(in: &contentBag)

        detailsWidget.$mapContent
            .sink {[unowned self] in
                mapState.content = $0
            }
            .store(in: &contentBag)

        detailsWidget.onClose = { [weak self] in
            self?.mode = .explore
        }

    }

    func ready() {
        exploreWidget.ready()
        prepExplore()
    }

}
