import Foundation

enum APIEndpoints {
    static let baseURL = "https://jsonplaceholder.typicode.com"

    static var users: String {
        return "\(baseURL)/users"
    }
}
