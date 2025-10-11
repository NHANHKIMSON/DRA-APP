import Foundation

@MainActor
final class UserViewModel: ObservableObject {
    @Published var auth: Auth?
    @Published var errorMessage: String?

    func login(email: String, password: String) async {
        let body = LoginRequest(email: email, password: password)
        let url = APIEndpoints.login
        do {
            let response = try await NetworkManager.shared.postData(
                to: url,
                body: body,
                type: Auth.self
            )
            self.auth = response
            print("Login success: \(response.payload.accessToken)")
        } catch {
            self.errorMessage = "Login failed: \(error.localizedDescription)"
            print(error)
        }
    }
}

