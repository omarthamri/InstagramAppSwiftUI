//
//  LoginViewModel.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 19/10/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
