import SwiftUI
struct HomeView: View{
    var body: some View{
        VStack(spacing: 16) {
                    Text("welcome_message") // Korean
                    Text("안녕하세요") // Korean
                        .font(.custom("NotoSansKR-Thin_Regular", size: 24))
                }
                .padding()
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
