//
//  DestinationState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import Foundation

public struct AmenityState: ViewState, TablePresentableState {
    public init(
        name: String,
        address: String,
        icon: ImageState.Image
    ) {
        self.name = name
        self.address = address
        self.icon = icon
    }

    public init(
        name: String,
        address: String,
        url: URL = URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
    ) {
        self.init(name: name, address: address, icon: .remote(url: url))
    }

    public let id: UUID  = UUID()

    public let name: String
    public let address: String
    public let icon: ImageState.Image
}
