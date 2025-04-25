//
//  TableBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI

public final class GalleryBuilder: UIBuilder {

    public struct GalleryContent: Identifiable {
        public let content: GalleryPresentableState

        public var id: UUID { content.id }
    }

    public init(contentBuilder: any UIBuilder) {
        self.contentBuilder = contentBuilder
    }

    public let contentBuilder: UIBuilder

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? GalleryState else {
            return nil
        }

        let wrappedContent  = state.content.map { GalleryContent(content: $0) }

        return
            ScrollView(.horizontal) {
                HStack {
                    ForEach(wrappedContent) { [contentBuilder] element in
                        let view = contentBuilder.view(for: element.content) ?? EmptyView()
                        AnyView(view)
                            .frame(width: UIScreen.main.bounds.width * 0.85)
                    }
                }
            }

    }

}

#Preview {
    let view = GalleryBuilder(contentBuilder: ImageBuilder()).view(
        for: GalleryState(
            content: [
                ImageState( .remote(url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!)),
                ImageState( .remote(url:  URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!)),
            ]
        )
    ) ?? EmptyView()
    view
}
