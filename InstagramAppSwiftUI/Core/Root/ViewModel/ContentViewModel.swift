//
//  ContentViewModel.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 19/10/2023.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    @Published var userSession: FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellable)
    }
}
