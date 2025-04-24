//
//  MessageState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import Foundation

public struct MessageState: ViewState, TablePresentableState {
    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    public let id = UUID()
    public let title: String
    public let message: String
}
