import SwiftUI
struct HistoryView: View{
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View{
        Text("History view")
            .font(.custom(languageManager.getFont(), size: 32))
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
