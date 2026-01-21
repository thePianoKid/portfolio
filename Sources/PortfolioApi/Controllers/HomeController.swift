import Vapor
import Foundation

struct HomeController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        routes.get(use: landingPage)
    }

    private func landingPage(req: Request) async throws -> View {
        let projects = try await Project.query(on: req.db).all()
        let posts = try await Post.query(on: req.db).all()

        let projectCards = projects.map { ProjectCard(project: $0) }
        let postCards = posts.map { PostCard(post: $0) }

        let context = HomeContext(
            title: "Portfolio API",
            projects: projectCards,
            posts: postCards,
            hasProjects: !projectCards.isEmpty,
            hasPosts: !postCards.isEmpty
        )

        return try await req.view.render("home", context)
    }
}

private struct HomeContext: Encodable {
    let title: String
    let projects: [ProjectCard]
    let posts: [PostCard]
    let hasProjects: Bool
    let hasPosts: Bool
}

private struct ProjectCard: Encodable {
    let id: String
    let title: String
    let description: String
    let image: String
    let liveProject: String
    let githubLink: String
    let videoDemo: String

    init(project: Project) {
        self.id = project.id?.uuidString ?? UUID().uuidString
        self.title = project.title
        self.description = project.description
        self.image = project.image
        self.liveProject = project.liveProject.absoluteString
        self.githubLink = project.githubLink.absoluteString
        self.videoDemo = project.videoDemo.absoluteString
    }
}

private struct PostCard: Encodable {
    let id: String
    let author: String
    let lastUpdated: String
    let title: String
    let body: String

    init(post: Post) {
        self.id = post.id?.uuidString ?? UUID().uuidString
        self.author = post.author
        self.title = post.title
        self.body = post.body
        self.lastUpdated = DateFormatter.postFormatter.string(from: post.lastUpdated)
    }
}

private extension DateFormatter {
    static let postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}
