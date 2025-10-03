import SwiftUI
import Foundation
struct UserListView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar
                contentView
            }
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    refreshButton
                }
            }
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
    
    
    // MARK: - Subviews
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search users...", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
    
    
    
    @ViewBuilder
    private var contentView: some View {
        if viewModel.isLoading && viewModel.users.isEmpty {
            ProgressView("Loading users...")
        } else if let errorMessage = viewModel.errorMessage {
            ErrorView(
                errorMessage: errorMessage,
                onRetry: {
                    Task { await viewModel.refreshUsers() }
                }
            )
        } else if viewModel.filteredUsers.isEmpty {
            EmptyStateView()
        } else {
            userList
        }
    }
    
    
    
    private var userList: some View {
        List(viewModel.filteredUsers) { user in
            UserRowView(user: user)
                .listRowSeparator(.visible)
        }
        .refreshable {
            await viewModel.refreshUsers()
        }
    }
    
    private var refreshButton: some View {
        Button {
            Task { await viewModel.refreshUsers() }
        } label: {
            Image(systemName: "arrow.clockwise")
        }
        .disabled(viewModel.isLoading)
    }
}

// MARK: - Supporting Views
struct UserRowView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(user.name)
                .font(.headline)
            
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Text(user.phone)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}

struct ErrorView: View {
    let errorMessage: String
    let onRetry: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Oops!")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(errorMessage)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button("Try Again", action: onRetry)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.2.slash")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            
            Text("No Users Found")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Try adjusting your search or check your connection")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

