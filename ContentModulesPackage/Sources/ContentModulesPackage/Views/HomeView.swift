//
//  HomeView.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import SwiftUI
import Combine

public class HomeState: ObservableObject, ViewState {
    public init(mapState: MapState, contentState: any ViewState) {
        self.mapState = mapState
        self.contentState = contentState
    }
    
    @Published public var mapState: MapState
    @Published public var contentState: ViewState
}

struct HomeView: View {
    let builder: UIBuilder
    @ObservedObject var state: HomeState

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    let view = builder.view(for: state.mapState) ?? EmptyView()
                    AnyView(view)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height * 2/3,
                        )
                    ScrollView(.vertical) {
                        let view = builder.view(for: state.contentState)?.padding() ?? EmptyView()
                        AnyView(view)
                    }
//                    .frame(
//                        width: geometry.size.width,
//                        height: geometry.size.height / 3,
//                    )
                    .background(.green)
//                    .offset(y: geometry.size.height * 2/3)
                }
            }
        }
    }
}


#Preview {
    HomeView(
        builder: factory,
        state: HomeState(
            mapState: MapState(content: [
                FlagMapState(coordinate: .london, name: "London", color: Color(hex: 0xff0000))
            ]),
//            contentState: MessageState(title: "hello", message: "world!")
            contentState: TableState(
                content:  [
                    MessageState(title: "hello", message: "world!"),
                    MessageState(title: "hello", message: "world!"),
                    MessageState(title: "hello", message: "world!"),
                    MessageState(title: "hello", message: "world!"),
                    AmenityState(
                        name: "Shepard's Bush ",
                        address: "London W3 3QQ",
                        icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                    )
                ]
            )
        )
    )
}

