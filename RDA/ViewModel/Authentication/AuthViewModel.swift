import Foundation

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    func login() async {
        do {
            try await UserService.shared.login(email: email, password: password)
            print(" Login successful! Token saved in Keychain.")
        } catch {
            errorMessage = "Login failed: \(error.localizedDescription)"
            print(" Error: \(error)")
        }
    }
}
