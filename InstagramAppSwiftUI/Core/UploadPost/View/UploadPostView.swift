//
//  UploadPostView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 18/10/2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var photoPickerPresented: Bool = false
    @StateObject private var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    var body: some View {
        VStack {
            // actions toolbar
            HStack {
                Button(action: {
                    clearPostDataAndReturnToView()
                }, label: {
                    Text("Cancel upload")
                })
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToView()
                    }
                }, label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                })
            }
            .padding(.horizontal)
            // post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:100,height: 100)
                        .clipped()
                }
                TextField("Enter your caption...",text: $caption,axis: .vertical)
            }
            .padding()
            Spacer()
        }
        .onAppear{
            photoPickerPresented.toggle()
        }
        .photosPicker(isPresented: $photoPickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}

extension UploadPostView {
    
    func clearPostDataAndReturnToView() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
    
}
