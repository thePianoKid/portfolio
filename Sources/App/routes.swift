import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: ProjectsController())
    try app.register(collection: PostsController())
}
