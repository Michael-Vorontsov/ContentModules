//
//  ContentView.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import SwiftUI
import MapKit
import ContentModulesPackage

struct HomeWrapperView: View {
    let viewModel = HomeWidgetModel()

    let viewFactory: ViewFactory = {
        let factory = ViewFactory()
        factory.builders = [
            AmenityBuilder(),
            ImageBuilder(),
            SearchBuilder(contentBuilder: factory),
            GalleryBuilder(contentBuilder: factory),
            TableBuilder(contentBuilder: factory),
            MessageBuilder(),
            MapBuilder(contentBuilder: FlagBuilder()),
            HomeBuilder(contentBuilder: factory),
            CloseButtonBuilder(),
            ZStackBuilder(contentBuilder: factory)
        ]
        return factory
    }()


    var body: some View {
        ZStack {
            let view = viewFactory.view(for: viewModel.homeState) ?? EmptyView()
            AnyView(view)
        }
    }
}

#Preview {
    HomeWrapperView()
}
