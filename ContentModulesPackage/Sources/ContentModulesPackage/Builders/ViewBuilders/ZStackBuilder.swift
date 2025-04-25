//
//  Untitled.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 25/04/2025.
//
import Foundation
import SwiftUI

final public class ZStackBuilder: UIBuilder {

    public  init(contentBuilder: any UIBuilder) {
        self.contentBuilder = contentBuilder
    }

    public struct TableContent: Identifiable {
        public let content: TablePresentableState

        public var id: UUID { content.id }
    }

    public let contentBuilder: UIBuilder

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? ZStackState else {
            return nil
        }

        let wrappedContent  = state.content.map { TableContent(content: $0) }
        return ZStack {
            ForEach(wrappedContent) { [contentBuilder] element in
                let view = contentBuilder.view(for: element.content) ?? EmptyView()
                AnyView(view)
            }
        }
    }

}
#Preview {
    let view = ZStackBuilder(contentBuilder: factory).view(
        for: ZStackState(
            content: [
                AmenityState(
                    name: "Shepard's Bush ",
                    address: "London W3 3QQ",
                    url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                ),
                CloseButtonState {
                    print("Hello1")
                }
            ]
        )
    ) ?? EmptyView()
    view
}
