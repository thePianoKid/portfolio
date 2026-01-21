import Vapor
import Fluent

struct ProjectsGalleryController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("projects", "gallery", use: gallery)
    }

    private func gallery(req: Request) async throws -> View {
        let projects = try await Project.query(on: req.db).all()
        let layouts: [GalleryProject.Layout] = [.tallLeft, .wideTopRight, .squareBottomRight, .tallBottomLeft]
        let placeholders = ["train.ai", "Retell", "Notion x Shopify", "Fitness app"]

        var cards: [GalleryProject] = []
        for index in 0..<layouts.count {
            let title = projects.indices.contains(index) ? projects[index].title : placeholders[index]
            cards.append(GalleryProject(title: title, layout: layouts[index]))
        }

        let context = ProjectsGalleryContext(projects: cards)
        return try await req.view.render("projects", context)
    }
}

private struct ProjectsGalleryContext: Encodable {
    let projects: [GalleryProject]
}

private struct GalleryProject: Encodable {
    enum Layout: String, Encodable {
        case tallLeft = "tall-left"
        case wideTopRight = "wide-top-right"
        case squareBottomRight = "square-bottom-right"
        case tallBottomLeft = "tall-bottom-left"
    }

    let title: String
    let layout: Layout
}
