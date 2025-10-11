import Foundation

enum APIEndpoints {
    static let baseURL = "http://localhost:8080/api/v1"

    static var login: String{
        return "\(baseURL)/auths/login"
    }
}
