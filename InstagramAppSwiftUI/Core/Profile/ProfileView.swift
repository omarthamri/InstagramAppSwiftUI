//
//  ProfileView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                VStack(spacing: 10) {
                    //pic and stats
                    HStack {
                        Image("wanda")
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
                        Text("Wanda Maximov")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Avengers for life")
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
    ProfileView()
}
