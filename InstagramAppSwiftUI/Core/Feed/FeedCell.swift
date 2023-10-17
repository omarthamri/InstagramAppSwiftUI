//
//  FeedCell.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // image + username
            HStack {
                Image("MichaelScott")
                    .resizable()
                    .scaledToFill()
                    .frame(width:40,height: 40)
                    .clipShape(Circle())
                Text("Michael Scott")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading,8)
            // Post image
            Image("office")
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
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            // caption label
            HStack {
                Text("Michael Scott ").fontWeight(.semibold) + Text("Not just a job but a family")
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
    FeedCell()
}
