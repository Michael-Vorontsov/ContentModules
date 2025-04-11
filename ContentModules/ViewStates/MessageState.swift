//
//  MessageState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import Foundation

struct MessageState: ViewState, TablePresentableState {
    let id = UUID()
    let title: String
    let message: String
}
