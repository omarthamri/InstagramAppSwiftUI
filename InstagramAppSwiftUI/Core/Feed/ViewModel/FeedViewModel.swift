//
//  FeedViewModel.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 21/10/2023.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
    }
    
    
}
