//
//  Untitled.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 25/04/2025.
//

import Foundation

public struct CloseButtonState: ViewState, TablePresentableState {
    public let id = UUID()

    public let onClose: () -> Void

    public init(onClose: @escaping () -> Void) {
        self.onClose = onClose
    }
}
