//
//  TableBuilder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 03/04/2025.
//

import SwiftUI

final public class TableBuilder: UIBuilder {
  
    public  init(contentBuilder: any UIBuilder) {
        self.contentBuilder = contentBuilder
    }
    public let contentBuilder: UIBuilder

    public func view(for viewState: any ViewState) -> (any View)? {
        guard let state = viewState as? TableState else {
            return nil
        }

        return TableView(contentBuilder: contentBuilder, state: state)
    }

}

#Preview {
    let view = TableBuilder(contentBuilder: factory).view(
        for: TableState(
            content: [
                AmenityState(
                    name: "Shepard's Bush ",
                    address: "London W3 3QQ",
                    url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                ),
                GalleryState(content: []),
                AmenityState(
                    name: "Westfield",
                    address: "London W7 6QQ",
                    url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                ),
                GalleryState(content: [])
            ]
        )
    ) ?? EmptyView()
    view
}
