//
//  ImageState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import Foundation

public struct ImageState: ViewState, GalleryPresentableState, TablePresentableState {
    public enum Image {
        case system(name: String)
        case data(data: Data)
        case remote(url: URL)
    }

    public  init(_ image: Image) {
        self.image = image
    }
    
    public let id = UUID()

    public let image: Image
}
