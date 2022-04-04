//
//  News.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//

import Foundation

// MARK: - News
struct News: Codable {
    let posts: [miniPost]?
}

// MARK: - miniPost
struct miniPost: Codable {
    let postID, timeshamp: Int?
    let title, previewText: String?
    let likesCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
