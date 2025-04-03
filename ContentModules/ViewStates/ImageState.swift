//
//  ImageState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import Foundation

struct ImageState: ViewState, GalleryPresentableState, TablePresentableState {
    let id = UUID()
    
    let url: URL
}
