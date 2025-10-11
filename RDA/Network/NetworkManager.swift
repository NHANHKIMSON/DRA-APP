import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    // MARK: - GET Request (with optional JWT)
    func fetchData<T: Decodable>(from urlString: String, type: T.Type, requiresAuth: Bool = false) async throws -> T {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        if requiresAuth, let token = Authentication.shared.getAccessToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        if httpResponse.statusCode == 401 {
            throw NetworkError.unauthorized
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

    // MARK: - POST Request
    func postData<T: Encodable, U: Decodable>(to urlString: String, body: T, type: U.Type) async throws -> U {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode(U.self, from: data)
    }
}
