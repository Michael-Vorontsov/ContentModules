//
//  HomeViewModel.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 24/04/2025.
//

import ContentModulesPackage
import Foundation

final class FakeViewModel {
    var state: TableState = TableState(
        content: [
            AmenityState(
                name: "Shepard's Bush ",
                address: "London W3 3QQ",
                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
            ),
            MessageState(title: "Hello", message: "World!"),
            GalleryState(content: [
                TableState(
                    content: [
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        )
                        //                        MessageState(title: "1", message: ""),
                        //                        MessageState(title: "2", message: ""),
                        //                        MessageState(title: "3", message: ""),
                        //                        MessageState(title: "4", message: ""),
                    ]),
                ImageState(url: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!),
                TableState(
                    content: [

                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        ),
                        AmenityState(
                            name: "Shepard's Bush ",
                            address: "London W3 3QQ",
                            icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
                        )
                        //                        MessageState(title: "1", message: ""),
                        //                        MessageState(title: "2", message: ""),
                        //                        MessageState(title: "3", message: ""),
                        //                        MessageState(title: "4", message: ""),
                    ]
                )
            ]),
            AmenityState(
                name: "Westfield",
                address: "London W7 6QQ",
                icon: URL(string: "https://www.myiconstory.com/wp-content/uploads/2018/08/Shepherds-Bush.png")!
            ),
            GalleryState(content: [])
        ]
    )

}
