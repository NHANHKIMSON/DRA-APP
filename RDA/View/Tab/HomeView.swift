import SwiftUI
import Foundation
struct HomeView: View{
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View{
        VStack(spacing: 16) {
            Text("test")
                .font(.custom(languageManager.getFont(), size: 32))
            LanguageSwitcher()
        }
        .padding()
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
