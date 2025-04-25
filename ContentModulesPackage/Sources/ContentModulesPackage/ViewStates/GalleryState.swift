//
//  GalleryState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import Combine
import Foundation

public protocol GalleryPresentableState: ViewState {
    var id: UUID { get }
}

public class GalleryState: ObservableObject, ViewState, TablePresentableState {
    public let id: UUID = UUID()

    public
    init(content: [any GalleryPresentableState]) {
        self.content = content
    }

    @Published public var content: [GalleryPresentableState]
    @Published public var visible: ([GalleryPresentableState], Range<Int>)?
    @Published public var selected: (GalleryPresentableState, Int)?
}
