//
//  SearchViewModel.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 19/10/2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    func fetchAllUsers() async throws {
        let users = try await UserService.fetchAllUsers()
    }
    
}
