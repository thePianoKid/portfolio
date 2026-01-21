//
//  Project.swift
//  PortfolioApi
//
//  Created by Gabe on 2026-01-20.
//
import Fluent
import Foundation
import Vapor

final class Project : Model, @unchecked Sendable, Content {
    static let schema = "project"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "image")
    var image: String
    
    @Field(key: "live_project")
    var liveProject: URL
    
    @Field(key: "github_link")
    var githubLink: URL
    
    @Field(key: "video_demo")
    var videoDemo: URL
    
    init() {}
    
    init(
        id: UUID? = nil,
        title: String,
        description: String,
        image: String,
        liveProject: URL,
        githubLink: URL,
        videoDemo: URL
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.liveProject = liveProject
        self.githubLink = githubLink
        self.videoDemo = videoDemo
    }
}
