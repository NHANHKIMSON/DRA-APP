//
//  Welcome.swift
//  RDA
//
//  Created by Apple on 10/11/25.
//


import Foundation

// MARK: - Welcome
class Auth: Codable {
    let message, status, requestedTime: String
    let payload: Payload

    init(message: String, status: String, requestedTime: String, payload: Payload) {
        self.message = message
        self.status = status
        self.requestedTime = requestedTime
        self.payload = payload
    }
}

// MARK: - Payload
class Payload: Codable {
    let accessToken, refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }

    init(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
