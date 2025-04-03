//
//  AmenityView.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//

import SwiftUI

struct AmenityView: View {
    let state: AmenityState

    var body: some View {
        ZStack {
            HStack {
                AsyncImage(url: state.icon){ result in
                    result.image?
                        .resizable()
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                Spacer()
                VStack(alignment: .leading) {
                    Text(state.name)
                        .font(.headline)
                    Text(state.address)
                        .font(.caption)
                }
                Spacer()
            }
        }
        .padding()
        .border(.black, width: 1)
        .padding()
    }
}



#Preview {
    AmenityView(
        state: .init(
            name: "Shepard's Bush ",
            address: "London W3 3QQ",
            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
        )
    )
}
