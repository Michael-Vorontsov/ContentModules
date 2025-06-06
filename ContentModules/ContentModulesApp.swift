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
//    let viewModel = SampleSearchWidgetModel()

//    let viewFactory: ViewFactory = {
//        let factory = ViewFactory()
//        factory.builders = [
//            AmenityBuilder(),
//            ImageBuilder(),
//            SearchBuilder(contentBuilder: factory),
//            GalleryBuilder(contentBuilder: factory),
//            TableBuilder(contentBuilder: factory),
//            MessageBuilder(),
//            HomeBuilder(contentBuilder: factory)
//        ]
//        return factory
//    }()

    var body: some Scene {
        WindowGroup {
            HomeWrapperView()
        }
    }
}
