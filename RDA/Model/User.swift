import Foundation

// Data Model
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
}

// API Error Model
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(String)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Invalid response from server"
        case .decodingError: return "Failed to decode data"
        case .serverError(let message): return message
        }
    }
}
