//
//  UserViewModel.swift
//  EasyCheck App
//
//  Created by Apple on 10/2/25.
//


import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText = ""
    
    // MARK: - Private Properties
    private let userService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Computed Properties
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        }
        return users.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    // MARK: - Initializer (Dependency Injection)
    init(userService: UserServiceProtocol = UserService.shared) {
        self.userService = userService
        setupSearchPublisher()
    }
    
    // MARK: - Public Methods
    @MainActor
    func fetchUsers() async {
        isLoading = true
        errorMessage = nil
        
        do {
            users = try await userService.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
            print("Error fetching users: \(error)")
        }
        
        isLoading = false
    }
    
    func refreshUsers() async {
        await fetchUsers()
    }
    
    // MARK: - Private Methods
    private func setupSearchPublisher() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}