// The Swift Programming Language
// https://docs.swift.org/swift-book


@MainActor internal let factory: ViewFactory = {
    let factory = ViewFactory()
    factory.builders = [
        MessageBuilder(),
        AmenityBuilder(),
        ImageBuilder(),
        GalleryBuilder(contentBuilder: factory),
        TableBuilder(contentBuilder: factory)
    ]
    return factory
}()
