//
//  SearchView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0...15,id: \.self) { user in
                        HStack {
                            Image("MichaelScott")
                                .resizable()
                                .scaledToFill()
                                .frame(width:40,height:40)
                            .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("Michael Scott")
                                    .fontWeight(.semibold)
                                Text("Manager Dunder Mufflin")
                            }
                            .font(.footnote)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
                .searchable(text: $searchText,prompt: "Searching...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
