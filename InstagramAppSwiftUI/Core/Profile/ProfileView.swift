//
//  ProfileView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.mockPosts.filter({$0.user?.username == user.username})
    }
    var body: some View {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
               PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    ProfileView(user: User.mockUsers[0])
}
