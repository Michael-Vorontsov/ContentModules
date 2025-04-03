//
//  GalleryState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import Combine
import Foundation

protocol GalleryPresentableState: ViewState {
    var id: UUID { get }

}

class GalleryState: ViewState, TablePresentableState {
    let id: UUID = UUID()


    internal init(content: [any GalleryPresentableState]) {
        self.content = content
    }

    @Published var content: [GalleryPresentableState]
    @Published var visible: ([GalleryPresentableState], Range<Int>)?
    @Published var selected: (GalleryPresentableState, Int)?
}
