// UserService.swift

import Foundation

final class UserService: UserServiceProtocol {
    static let shared = UserService()
    private init() {}

    func fetchUsers() async throws -> [User] {
        // Use the shared NetworkManager instead of raw URLSession
        let users = try await NetworkManager.shared.fetchData(
            from: APIEndpoints.users,
            type: [User].self
        )
        return users
    }
}
