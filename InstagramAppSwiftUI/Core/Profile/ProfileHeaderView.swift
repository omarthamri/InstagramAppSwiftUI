//
//  ProfileHeaderView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 18/10/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
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
            Button(action: {}, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 360,height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6).stroke(.gray,lineWidth: 1)
                    }
            })
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.mockUsers[0])
}
