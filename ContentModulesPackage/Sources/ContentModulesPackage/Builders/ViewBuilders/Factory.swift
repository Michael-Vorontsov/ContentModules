//
//  Factory.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

public final class ViewFactory: UIBuilder {
    public  init(builders: [any UIBuilder] = []) {
        self.builders = builders
    }

    public var builders: [any UIBuilder] = []

    public func view(for viewState: any ViewState) -> (any View)? {
        for each in builders {
            if let result = each.view(for: viewState) {
                return result
            }
        }
        return nil
    }
    

}
