//
//  UserViewModel.swift
//  EasyCheck App
//
//  Created by Apple on 10/1/25.
//


import Combine
import Foundation
class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadUsers() {
        isLoading = true
        errorMessage = nil

        NetworkManager.shared.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .success(let fetchedUsers):
                    self.users = fetchedUsers
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
