// UserService.swift

import Foundation

final class UserService: UserServiceProtocol {
    static let shared = UserService()
    private init() {}

    func login(email: String, password: String) async throws -> Auth {
        let loginRequest = LoginRequest(email: email, password: password)
        let response = try await NetworkManager.shared.postData(to: APIEndpoints.login, body: loginRequest, type: Auth.self)
        return response
    }
}
