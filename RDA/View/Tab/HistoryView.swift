import SwiftUI
struct HistoryView: View{
    var body: some View{
        Text("History view")
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
