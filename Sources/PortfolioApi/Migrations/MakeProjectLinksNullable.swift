import Fluent
import FluentSQL

struct MakeProjectLinksNullable: AsyncMigration {
    func prepare(on database: any Database) async throws {
        guard let sql = database as? any SQLDatabase else { return }
        try await sql.raw("ALTER TABLE project ALTER COLUMN live_project DROP NOT NULL").run()
        try await sql.raw("ALTER TABLE project ALTER COLUMN github_link DROP NOT NULL").run()
        try await sql.raw("ALTER TABLE project ALTER COLUMN video_demo DROP NOT NULL").run()
    }

    func revert(on database: any Database) async throws {
        guard let sql = database as? any SQLDatabase else { return }
        try await sql.raw("ALTER TABLE project ALTER COLUMN live_project SET NOT NULL").run()
        try await sql.raw("ALTER TABLE project ALTER COLUMN github_link SET NOT NULL").run()
        try await sql.raw("ALTER TABLE project ALTER COLUMN video_demo SET NOT NULL").run()
    }
}
