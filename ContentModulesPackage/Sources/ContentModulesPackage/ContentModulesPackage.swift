// The Swift Programming Language
// https://docs.swift.org/swift-book


@MainActor internal let factory: ViewFactory = {
    let factory = ViewFactory()
    let mapFactory = MapContentFactory()
    mapFactory.builders = [FlagBuilder()]
    factory.builders = [
        MessageBuilder(),
        AmenityBuilder(),
        ImageBuilder(),
        GalleryBuilder(contentBuilder: factory),
        TableBuilder(contentBuilder: factory),
        MapBuilder(contentBuilder: mapFactory)
    ]
    return factory
}()
