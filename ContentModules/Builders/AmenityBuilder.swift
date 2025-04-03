//
//  Untitled.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

final class AmenityBuilder: UIBuilder {
    func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? AmenityState else { return nil }

        return AmenityView(state: state)
    }
}
