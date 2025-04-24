//
//  SwiftUIView.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import SwiftUI
import Combine

struct SearchView: View {
    let viewBuilder: UIBuilder
    @ObservedObject var state: SearchState

    var body: some View {
        VStack {
            TextField("Search", text: $state.query)
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
    SearchView(
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
