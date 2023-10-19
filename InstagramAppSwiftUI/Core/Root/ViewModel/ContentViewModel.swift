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
    @Published var currentUser: User?
    private var cancellable = Set<AnyCancellable>()
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellable)
        
        service.$currentUser.receive(on: DispatchQueue.main).sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellable)
    }
}
