//
//  ContentView.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import SwiftUI
import MapKit
import ContentModulesPackage

struct ContentView: View {
    let viewModel = SampleSearchWidgetModel()

    let viewFactory: ViewFactory = {
        let factory = ViewFactory()
        factory.builders = [
            AmenityBuilder(),
            ImageBuilder(),
            SearchBuilder(contentBuilder: factory),
            GalleryBuilder(contentBuilder: factory),
            TableBuilder(contentBuilder: factory),
            MessageBuilder(),
            HomeBuilder(contentBuilder: factory)
        ]
        return factory
    }()


    var body: some View {
        ScrollView(.vertical) {
            let view = viewFactory.view(for: viewModel.searchState) ?? EmptyView()
            AnyView(view)
        }
    }
}

#Preview {
    ContentView()
}
