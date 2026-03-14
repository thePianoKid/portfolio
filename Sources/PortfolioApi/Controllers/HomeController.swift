import Vapor
import Foundation

struct HomeController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        routes.get(use: landingPage)
    }

    private func landingPage(req: Request) async throws -> View {
        return try await req.view.render("home")
    }
}
