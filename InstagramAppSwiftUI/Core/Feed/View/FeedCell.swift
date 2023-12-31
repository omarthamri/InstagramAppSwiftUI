//
//  FeedCell.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xsmall)
                    Text(post.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                    Spacer()
            }
            .padding(.leading,8)
            // Post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // action buttons
            HStack(spacing: 16) {
                Button(action: {
                    print("like post")
                }, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                Button(action: {
                    print("comment on post")
                }, label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                })
                Button(action: {
                    print("share post")
                }, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                Spacer()
            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundColor(.black)
            // likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            // caption label
            HStack {
                Text(post.user?.username ?? "").fontWeight(.semibold) + Text(" ") + Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading,10)
            .padding(.top,1)
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.mockPosts[0])
}
