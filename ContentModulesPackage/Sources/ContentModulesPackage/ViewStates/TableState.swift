//
//  TableState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import Combine
import Foundation

public protocol TablePresentableState: ViewState {
    var id: UUID { get }
}

public final class TableState: ObservableObject, ViewState, GalleryPresentableState {
    public let id = UUID()

    public  init(content: [any TablePresentableState]) {
        self.content = content
    }

    @Published public var content: [any TablePresentableState]
//    @Published var visible: ([any TablePresentableState], Range<Int>)?
//    @Published var selected: (any TablePresentableState, Int)?
}
