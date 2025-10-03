import SwiftUI
struct HomeView: View{
    var body: some View{
        VStack(spacing: 16) {
            Text("test")
                .font(.custom("NotoSans-Regular", size: 32))
            LanguageSwitcher()
        }
        .padding()
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
