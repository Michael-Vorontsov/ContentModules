//
//  DestinationState.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import Foundation

struct AmenityState: ViewState, TablePresentableState {
    var id: UUID  = UUID()

    let name: String
    let address: String
    let icon: URL
}
