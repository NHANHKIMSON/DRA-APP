import SwiftUI
struct HistoryView: View{
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            Color(colorScheme == .light ? Color.background : Color.clear).ignoresSafeArea(.all)
            VStack{
                Text("History view")
                    .font(.custom(languageManager.getFont(), size: 32))
            }
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
