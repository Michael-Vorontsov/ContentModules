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
                switch state.icon {
                case .system(let name):
                    Image(systemName: name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)

                case .data(let data):
                    Image(uiImage: UIImage(data: data)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)

                case .remote(let url):
                    AsyncImage(url: url){ result in
                        result.image?
                            .resizable()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(state.name)
                        .font(.headline)
                        .lineLimit(1)
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
            icon: .remote(url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!)
        )
    )
}
