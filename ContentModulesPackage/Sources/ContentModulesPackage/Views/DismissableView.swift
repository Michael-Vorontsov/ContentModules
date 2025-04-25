//
//  DismissableView.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 25/04/2025.
//

import SwiftUI
import Combine

struct DismissableView: View {
    let viewBuilder: UIBuilder
    @ObservedObject var state: SearchState

    var body: some View {
        VStack {
            TextField("Search", text: $state.query)
                .padding()
            if let result = state.result {
                let view = viewBuilder.view(for: result) ?? EmptyView()
                AnyView(view)
                Spacer()
            } else {
                Spacer()
            }
        }
    }
}

#Preview {
    DismissableView(
        viewBuilder: factory,
        state: SearchState(
            query: "",
//            result: MessageState(title: "Please type in", message: "We start searching")
            result: TableState(content: [
                MessageState(title: "Hello", message: "i'm in"),
                AmenityState(name: "sheapards bush", address: "some"),
                AmenityState(name: "sheapards bush", address: "some"),
                AmenityState(name: "sheapards bush", address: "some"),
                AmenityState(name: "sheapards bush", address: "some"),
            ])
        )
    )
}
