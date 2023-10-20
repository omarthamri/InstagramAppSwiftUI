//
//  ProfileHeaderView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 18/10/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
    @State private var showEditProfile: Bool = false
    var body: some View {
        VStack(spacing: 10) {
            //pic and stats
            HStack {
                Image(user.imageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width:80,height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack (spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 7, title: "Followers")
                    UserStatView(value: 2, title: "Following")
                }
            }
            .padding(.horizontal)
            // name and bio
            VStack(alignment: .leading,spacing: 4) {
                Text(user.username)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(user.bio ?? "")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            // action button
            Button(action: {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("follow user")
                }
            }, label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .frame(width: 360,height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear,lineWidth: 1)
                    }
            })
            Divider()
        }
        .sheet(isPresented: $showEditProfile) {
            Text("Edit profile view")
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.mockUsers[0])
}
