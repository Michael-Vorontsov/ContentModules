//
//  TableState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import Combine
import Foundation

protocol TablePresentableState: ViewState {
    var id: UUID { get }
}

class TableState: ViewState, GalleryPresentableState {
    let id = UUID()

    internal init(content: [any TablePresentableState]) {
        self.content = content
    }

    @Published var content: [any TablePresentableState]
    @Published var visible: ([any TablePresentableState], Range<Int>)?
    @Published var selected: (any TablePresentableState, Int)?
}
