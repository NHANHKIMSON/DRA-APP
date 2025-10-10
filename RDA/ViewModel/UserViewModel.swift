import Foundation

@MainActor
final class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?

    func loadUsers() async {
        do {
            users = try await UserService.shared.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
            print("Error: \(error.localizedDescription)")
        }
    }
}
