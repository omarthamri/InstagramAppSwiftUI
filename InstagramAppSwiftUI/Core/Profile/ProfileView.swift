//
//  ProfileView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    var body: some View {
            ScrollView {
                // header
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
                
                // post grid view
                LazyVGrid(columns: gridItems,spacing: 2) {
                        Image("wanda_1")
                            .resizable()
                            .scaledToFill()
                    Image("wanda")
                        .resizable()
                        .scaledToFill()
                    Image("wanda_3")
                        .resizable()
                        .scaledToFill()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    ProfileView(user: User.mockUsers[0])
}
