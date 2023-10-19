//
//  UserService.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 19/10/2023.
//

import Foundation
import Firebase

struct UserService {
    static func fetchAllUsers() async throws -> [User] {
        var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return users
    }
    
}
