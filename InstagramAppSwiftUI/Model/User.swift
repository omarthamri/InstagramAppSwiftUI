//
//  User.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 18/10/2023.
//

import Foundation
import Firebase

struct User: Identifiable,Codable,Hashable {
    
    let id: String
    var username: String
    var imageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return id == currentUid
    }
}

extension User {
    
    static var mockUsers: [User] = [
        .init(id: UUID().uuidString, username: "Michael Scott", imageUrl: nil, fullName: "Michael Scott", bio: "Dunder Mufflin manager", email: "michael.scott@gmail.com"),
        .init(id: UUID().uuidString, username: "Pam Beesly", imageUrl: nil, fullName: "Pam Beesly", bio: "Secretary", email: "pam.beesly@gmail.com"),
        .init(id: UUID().uuidString, username: "Dwight Schrute", imageUrl: nil, fullName: "Dwight Schrute", bio: "Dunder Mufflin salesman", email: "dwight.schrute@gmail.com"),
        .init(id: UUID().uuidString, username: "Jim Halpert", imageUrl: nil, fullName: "Jim Halpert", bio: "Dunder Mufflin salesman", email: "jim.halpert@gmail.com"),
        .init(id: UUID().uuidString, username: "Wanda Maximov", imageUrl: nil, fullName: "Wanda Maximov", bio: "works in Avengers", email: "wanda.maximov@gmail.com")
    ]
    
}
