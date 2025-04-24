//
//  ImageState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import Foundation

public struct ImageState: ViewState, GalleryPresentableState, TablePresentableState {
    public  init(url: URL) {
        self.url = url
    }
    
    public let id = UUID()

    public let url: URL
}
