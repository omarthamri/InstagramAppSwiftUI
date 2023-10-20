//
//  EditProfileView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 20/10/2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedItem: PhotosPickerItem?
    @State private var fullname = ""
    @State private var bio = ""
    @StateObject private var viewModel = EditProfileViewModel()
    var body: some View {
        VStack {
            //toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()
                    Text("Edit profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: {
                        print("update profile info")
                    }, label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    })
                }
                .padding(.horizontal)
                Divider()
            }
            // Edit profile pic
            VStack {
                PhotosPicker(selection: $viewModel.selectedImage) {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80,height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 80,height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    }
                }
                Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                Divider()
            }
            .padding(.vertical,8)
            // Edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name..", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio..", text: $viewModel.bio)
            }
            Spacer()
        }
    }
}

#Preview {
    EditProfileView()
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading,8)
                .frame(width: 100,alignment: .leading)
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
    
}
