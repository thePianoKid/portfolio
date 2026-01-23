import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: HomeController())
    try app.register(collection: ProjectsGalleryController())
    let apiV1 = app.grouped("api", "v1")
    try apiV1.register(collection: ProjectsController())
    try apiV1.register(collection: PostsController())
}
