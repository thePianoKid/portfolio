import Vapor
import Fluent

struct ProjectsGalleryController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        routes.get("projects", use: projectsGallery)
        routes.get("projects", ":projectID", use: projectDetail)
    }

    private func projectsGallery(req: Request) async throws -> View {
        let featuredIDs = try FeaturedProjectsConfig.loadFeaturedIDs(from: req.application)
        let projects = try await Project.query(on: req.db)
            .filter(\.$id ~~ featuredIDs)
            .all()

        // Preserve the config ordering
        let orderedProjects = featuredIDs.compactMap { id in
            projects.first(where: { $0.id == id })
        }

        let cards = orderedProjects.map { project in
            GalleryProject(
                id: project.id?.uuidString ?? "",
                title: project.title,
                description: project.description
            )
        }

        let context = ProjectsGalleryContext(projects: cards)
        return try await req.view.render("projects", context)
    }

    private func projectDetail(req: Request) async throws -> View {
        guard let projectID = req.parameters.get("projectID", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        guard let project = try await Project.find(projectID, on: req.db) else {
            throw Abort(.notFound)
        }

        let detail = ProjectDetailData(
            title: project.title,
            description: project.description,
            image: project.image,
            liveProject: project.liveProject?.absoluteString,
            githubLink: project.githubLink?.absoluteString,
            videoDemo: project.videoDemo?.absoluteString
        )

        let context = ProjectDetailContext(project: detail)
        return try await req.view.render("project-detail", context)
    }
}

private struct ProjectsGalleryContext: Encodable {
    let projects: [GalleryProject]
}

private struct GalleryProject: Encodable {
    let id: String
    let title: String
    let description: String
}

private struct ProjectDetailContext: Encodable {
    let project: ProjectDetailData
}

private struct ProjectDetailData: Encodable {
    let title: String
    let description: String
    let image: String
    let liveProject: String?
    let githubLink: String?
    let videoDemo: String?
}
