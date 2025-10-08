import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // Show users when loaded
                ForEach(viewModel.users) { user in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                await viewModel.loadUsers()
            }
            .overlay {
                if let error = viewModel.errorMessage {
                    VStack {
                        Text(" \(error)")
                            .foregroundColor(.red)
                            .padding()
                    }
                } else if viewModel.users.isEmpty {
                    ProgressView("Loading users...")
                }
            }
        }
    }
}
#Preview {
    UserListView()
}
