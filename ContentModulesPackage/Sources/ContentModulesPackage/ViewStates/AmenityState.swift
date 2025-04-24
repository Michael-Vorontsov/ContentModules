//
//  DestinationState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import Foundation

public struct AmenityState: ViewState, TablePresentableState {
    public init(id: UUID = UUID(), name: String, address: String, icon: URL) {
        self.id = id
        self.name = name
        self.address = address
        self.icon = icon
    }
    
    public var id: UUID  = UUID()

    public let name: String
    public let address: String
    public let icon: URL
}
