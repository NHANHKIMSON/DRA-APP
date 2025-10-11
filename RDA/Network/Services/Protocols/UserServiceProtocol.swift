// UserServiceProtocol.swift

import Foundation

protocol UserServiceProtocol {
    func login(email: String, password: String) async throws
}
