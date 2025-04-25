//
//  ImageVuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI

public final class ImageBuilder: UIBuilder {
    public init() {}

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? ImageState else { return nil }

        switch state.image {
        case .system(let name):
            return Image(systemName: name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)

        case .data(let data):

            return Image(uiImage: UIImage(data: data)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)

        case .remote(let url):
            return AsyncImage(url: url){ result in
                result.image?
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
        }
    }

}


#Preview {
    let view = GalleryBuilder(contentBuilder: ImageBuilder()).view(
        for: GalleryState(
            content: [
                ImageState(.system(name: "home"))
            ]
        )
    ) ?? EmptyView()
    view
}
