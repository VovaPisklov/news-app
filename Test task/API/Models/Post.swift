//
//  Posts.swift
//  Test task
//
//  Created by Vova on 31.03.2022.

import Foundation

// MARK: - Post
struct Post: Codable {
    let post: PostClass?
}

// MARK: - PostClass
struct PostClass: Codable {
    let postID, timeshamp: Int?
    let title, text: String?
    let images: [String]?
    let likesCount: Int?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title, text, images
        case likesCount = "likes_count"
    }
}
