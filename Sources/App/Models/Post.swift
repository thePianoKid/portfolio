import Fluent
import Foundation

final class Post: Model, @unchecked Sendable {
    static let schema = "post"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "author")
    var author: String

    @Field(key: "last_updated")
    var lastUpdated: Date

    @Field(key: "title")
    var title: String

    @Field(key: "body")
    var body: String

    init() {}

    init(
        id: UUID? = nil,
        author: String,
        lastUpdated: Date,
        title: String,
        body: String
    ) {
        self.id = id
        self.author = author
        self.lastUpdated = lastUpdated
        self.title = title
        self.body = body
    }
}
