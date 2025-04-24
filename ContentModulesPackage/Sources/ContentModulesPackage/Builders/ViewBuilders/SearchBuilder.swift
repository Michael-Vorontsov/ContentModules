//
//  SearchBuilder.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import SwiftUI

final public class SearchBuilder: UIBuilder {

    public  init(contentBuilder: any UIBuilder) {
        self.contentBuilder = contentBuilder
    }
    public let contentBuilder: UIBuilder

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? SearchState else {
            return nil
        }
        return SearchView(viewBuilder: contentBuilder, state: state)
    }

}
