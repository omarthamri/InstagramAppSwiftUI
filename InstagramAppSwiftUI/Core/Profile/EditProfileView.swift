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
                .padding()
                Divider()
            }
            // Edit profile pic
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 80,height: 80)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                }
            }
            // Edit profile info
            Spacer()
        }
    }
}

#Preview {
    EditProfileView()
}
