import SwiftUI
struct NotificationView: View {
    var body: some View {
        Text("Notification")
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
