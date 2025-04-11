//
//  ContentModulesApp.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import SwiftUI
import Combine

@main
struct ContentModulesApp: App {
    let viewModel = HomeViewModel()

    let viewFactory: ViewFactory = {
        let factory = ViewFactory()
        let tableBuilder = TableBuilder(contentBuilder: factory)
        factory.builders = [
            tableBuilder,
            MessageBuilder(),
            ImageBuilder(),
            AmenityBuilder(),
            MessageBuilder()
        ]
        return factory
    }()

    var body: some Scene {
        WindowGroup {
            let view = factory.view(for: viewModel.state) ?? EmptyView()
            AnyView(view)
        }
    }
}

final class HomeViewModel {
    var state: TableState = TableState(
        content: [
            AmenityState(
                name: "Shepard's Bush ",
                address: "London W3 3QQ",
                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
            ),
            MessageState(title: "Hello", message: "World!"),
            GalleryState(content: [
                TableState(
                    content: [
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        )
//                        MessageState(title: "1", message: ""),
//                        MessageState(title: "2", message: ""),
//                        MessageState(title: "3", message: ""),
//                        MessageState(title: "4", message: ""),
                    ]),

                    TableState(
                        content: [
                            
                            AmenityState(
                                name: "Shepard's Bush ",
                                address: "London W3 3QQ",
                                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                            ),
                            AmenityState(
                                name: "Shepard's Bush ",
                                address: "London W3 3QQ",
                                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                            ),
                            AmenityState(
                                name: "Shepard's Bush ",
                                address: "London W3 3QQ",
                                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                            ),
                            AmenityState(
                                name: "Shepard's Bush ",
                                address: "London W3 3QQ",
                                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                            )
    //                        MessageState(title: "1", message: ""),
    //                        MessageState(title: "2", message: ""),
    //                        MessageState(title: "3", message: ""),
    //                        MessageState(title: "4", message: ""),
                        ]
                )
            ]),
            AmenityState(
                name: "Westfield",
                address: "London W7 6QQ",
                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
            ),
            GalleryState(content: [])
        ]
    )

}
