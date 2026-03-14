import Fluent

struct MakeProjectLinksOptional: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(Project.schema)
            .updateField("live_project", .string)
            .updateField("github_link", .string)
            .updateField("video_demo", .string)
            .update()
    }

    func revert(on database: any Database) async throws {
        try await database.schema(Project.schema)
            .updateField("live_project", .string)
            .updateField("github_link", .string)
            .updateField("video_demo", .string)
            .update()
    }
}
