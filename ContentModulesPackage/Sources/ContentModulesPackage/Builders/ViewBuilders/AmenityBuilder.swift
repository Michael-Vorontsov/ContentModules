//
//  Untitled.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

public final class AmenityBuilder: UIBuilder {
    public init() {}
    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? AmenityState else { return nil }

        return AmenityView(state: state)
    }
}
