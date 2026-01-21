import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
//    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(
        .postgres(
            configuration: .init(
                hostname: "localhost",
                username: "vapor",
                password: "vapor",
                database: "vapor",
                tls: .disable
            )
        ),
        as: .psql
    )
    
    app.migrations.add(CreateProject())
    app.migrations.add(CreatePost())

    // register routes
    try routes(app)
}
