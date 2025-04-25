//
//  HomeBuilder.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 24/04/2025.
//
import SwiftUI

public final class HomeBuilder: UIBuilder {
    public init(contentBuilder: any UIBuilder) {
        self.contentBuilder = contentBuilder
    }

    public let contentBuilder: UIBuilder

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? HomeState else { return nil }

        return HomeView(builder: contentBuilder, state: state)
    }
}

#Preview {
    let view = HomeBuilder(contentBuilder: factory)
        .view(
            for:HomeState(
                mapState: MapState(content: []),
                //            contentState: MessageState(title: "hello", message: "world!")
                contentState: TableState(
                    content:  [
                        MessageState(title: "world", message: "world!"),
                        MessageState(title: "hello", message: ""),
                        MessageState(title: "hello", message: "world!"),
                        MessageState(title: "hello", message: "world!"),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: .remote(url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!)
                        )
                    ]
                )
            )
        ) ?? EmptyView()

    AnyView(view)
}

