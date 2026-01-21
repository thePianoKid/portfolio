//
//  CreatePost.swift
//  PortfolioApi
//
//  Created by Gabe on 2026-01-21.
//

import Fluent

struct CreatePost: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(Post.schema)
            .id()
            .field("author", .string, .required)
            .field("last_updated", .datetime, .required)
            .field("title", .string, .required)
            .field("body", .string, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema(Post.schema).delete()
    }
}
