//
//  FeedView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top,8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("Instagram_Logo")
                        .resizable()
                        .frame(width: 100,height: 32)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
