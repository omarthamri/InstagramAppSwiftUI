//
//  EditProfileViewModel.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 20/10/2023.
//

import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectedImage)} }
    }
    @Published var profileImage: Image?
    @Published var fullname: String = ""
    @Published var bio: String = ""
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String:Any]()
        // update profile image if changed
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["imageUrl"] = imageUrl
        }
        // update name if changed
        if !fullname.isEmpty && fullname != user.username {
            data["username"] = fullname
        }
        
        // update bio if changed
        if !bio.isEmpty && bio != user.bio {
            data["bio"] = bio
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
    
    
}
