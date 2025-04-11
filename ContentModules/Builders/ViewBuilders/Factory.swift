//
//  Factory.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

final class ViewFactory: UIBuilder {

    var builders: [any UIBuilder] = []

    func view(for viewState: any ViewState) -> (any View)? {
        for each in builders {
            if let result = each.view(for: viewState) {
                return result
            }
        }
        return nil
    }
    

}
