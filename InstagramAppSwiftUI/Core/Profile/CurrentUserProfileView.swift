//
//  CurrentUserProfileView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 18/10/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.mockPosts.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    })
                    
                }
            }
        }
        }
    }

#Preview {
    CurrentUserProfileView(user: User.mockUsers[4])
}
