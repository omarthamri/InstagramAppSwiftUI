//
//  PostService.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 21/10/2023.
//

import Foundation
import Firebase

struct PostService {
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        for i in 0..<posts.count {
            let ownerUid = posts[i].ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: uid).getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        return posts
    }
    
}
