//
//  HomeBuilder.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 24/04/2025.
//
import SwiftUI

public final class HomeBuilder: UIBuilder {
    public init(contentBuilder: any UIBuilder) {
        self.contentBuilder = contentBuilder
    }

    public let contentBuilder: UIBuilder

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? HomeState else { return nil }

        return HomeView(builder: contentBuilder, state: state)
    }
}
