//
//  NetworkManager.swift
//  RDA
//
//  Created by Apple on 10/8/25.
//


// NetworkManager.swift

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    /// Generic GET request function
    func fetchData<T: Decodable>(from urlString: String, type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError
        }
    }

    /// Generic POST request function
    func postData<T: Codable, U: Decodable>(to urlString: String, body: T, type: U.Type) async throws -> U {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            throw NetworkError.decodingError
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        do {
            let decodedResponse = try JSONDecoder().decode(U.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodingError
        }
    }
}