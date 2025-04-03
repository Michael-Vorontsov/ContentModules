//
//  TableBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI

final class GalleryBuilder: UIBuilder {

    struct GalleryContent: Identifiable {
        let content: GalleryPresentableState

        var id: UUID { content.id }
    }

    internal init(contentBuilder: any UIBuilder) {
        self.contentBuilder = contentBuilder
    }
    let contentBuilder: UIBuilder

    func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? GalleryState else {
            return nil
        }

        let wrappedContent  = state.content.map { GalleryContent(content: $0) }
        return ScrollView(.horizontal) {
            HStack {
                ForEach(wrappedContent) { [contentBuilder] element in
                    let view = contentBuilder.view(for: element.content) ?? EmptyView()
                    AnyView(view)
                }
            }
        }
    }

}

#Preview {
    let view = GalleryBuilder(contentBuilder: ImageBuilder()).view(
        for: GalleryState(
            content: [
                ImageState( url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!),
                ImageState( url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!),
            ]
        )
    ) ?? EmptyView()
    view
}
