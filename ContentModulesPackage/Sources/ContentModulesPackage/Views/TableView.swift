//
//  SwiftUIView.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 25/04/2025.
//

import SwiftUI
import Combine

struct TableView: View {
    private struct TableContent: Identifiable {
        let content: TablePresentableState

        var id: UUID { content.id }
    }

    let contentBuilder: UIBuilder
    @ObservedObject var state: TableState

    var body: some View {
        let wrappedContent  = state.content.map { TableContent(content: $0) }

        VStack {
            ForEach(wrappedContent) { [contentBuilder] element in
                let view = contentBuilder.view(for: element.content) ?? EmptyView()
                AnyView(view)
            }
        }
    }
}

#Preview {
    TableView(
        contentBuilder: factory,
        state: TableState(
            content: [
                AmenityState(
                    name: "Shepard's Bush ",
                    address: "London W3 3QQ",
                    url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                ),
                GalleryState(content: []),
                AmenityState(
                    name: "Westfield",
                    address: "London W7 6QQ",
                    url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                ),
                GalleryState(content: [])
            ]
        )
    )
}
