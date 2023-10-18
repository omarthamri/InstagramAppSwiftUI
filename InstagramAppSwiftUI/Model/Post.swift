//
//  Post.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 18/10/2023.
//

import Foundation

struct Post: Identifiable,Hashable,Codable {
    
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    
    static var mockPosts: [Post] = [
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Not just a job, It's a family", likes: 6, imageUrl: "office", timestamp: Date(),user: User.mockUsers[0]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Ready for halloween !!!", likes: 2, imageUrl: "halloween", timestamp: Date(),user: User.mockUsers[2]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Saving the world", likes: 5, imageUrl: "wanda_3", timestamp: Date(),user: User.mockUsers[4]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Fighting Thanos army", likes: 4, imageUrl: "wanda_1", timestamp: Date(),user: User.mockUsers[4]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Having fun!!!", likes: 2, imageUrl: "wanda", timestamp: Date(),user: User.mockUsers[4])
    ]
    
}
