import SwiftUI

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var email = "admin@gmail.com"
    @State private var password = "123"

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                Task {
                    await viewModel.login(email: email, password: password)
                }
            }
            .buttonStyle(.borderedProminent)

            if let token = viewModel.auth?.payload.accessToken {
                Text("Access Token: \(token)")
                    .font(.caption)
                    .padding()
            }

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
