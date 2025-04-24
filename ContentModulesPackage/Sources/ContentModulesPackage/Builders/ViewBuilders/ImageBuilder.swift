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

        return AsyncImage(url: state.url){ result in
            result.image?
                .resizable()
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
    }

}
