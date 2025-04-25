//
//  CloseButtonBuilder.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 25/04/2025.
//

import SwiftUI

final public class CloseButtonBuilder: UIBuilder {

    public init() {}

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? CloseButtonState else {
            return nil
        }
        return HStack {
            Spacer()
            Button {
                state.onClose()
            } label: {
                Image(systemName: "xmark.circle.fill")
            }
        }
        .padding()
    }

}

#Preview {
    let view = CloseButtonBuilder().view(for: CloseButtonState(onClose: {
        print("xmark")
    })) ?? EmptyView()
    view
}
