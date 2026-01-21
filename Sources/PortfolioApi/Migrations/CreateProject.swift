//
//  CreateProject.swift
//  PortfolioApi
//
//  Created by Gabe on 2026-01-21.
//

import Fluent

struct CreateProject: AsyncMigration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: any Database) async throws {
        try await database.schema(Project.schema)
            .id()
            .field("title", .string, .required)
            .field("description", .string, .required)
            .field("image", .string, .required)
            .field("live_project", .string, .required)
            .field("github_link", .string, .required)
            .field("video_demo", .string, .required)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: any Database) async throws {
        try await database.schema(Project.schema).delete()
    }
}
