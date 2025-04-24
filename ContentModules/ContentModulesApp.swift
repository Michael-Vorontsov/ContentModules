//
//  ContentModulesApp.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import SwiftUI
import Combine
import ContentModulesPackage


@main
struct ContentModulesApp: App {
    let viewModel = FakeViewModel()

    let viewFactory: ViewFactory = {
        let factory = ViewFactory()
        factory.builders = [
            AmenityBuilder(),
            ImageBuilder(),
            GalleryBuilder(contentBuilder: factory),
            TableBuilder(contentBuilder: factory),
            MessageBuilder()
        ]
        return factory
    }()

    var body: some Scene {
        WindowGroup {
            let view = viewFactory.view(for: viewModel.state) ?? EmptyView()
            AnyView(view)
        }
    }
}
