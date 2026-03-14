import Foundation
import Vapor

struct FeaturedProjectsConfig {
    static func loadFeaturedIDs(from app: Application) throws -> [UUID] {
        let path = app.directory.resourcesDirectory + "Config/featured-projects.json"
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return try JSONDecoder().decode([UUID].self, from: data)
    }
}
