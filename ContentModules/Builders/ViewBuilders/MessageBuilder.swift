//
//  MessageBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI

class MessageBuilder: UIBuilder {

    func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? MessageState else { return nil }

        return  VStack {
            Text(state.title)
                .font(.title)
            Text(state.message)
                .font(.body)
        }
    }
}
