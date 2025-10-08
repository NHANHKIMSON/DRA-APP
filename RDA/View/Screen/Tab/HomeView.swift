import SwiftUI
import Foundation
struct HomeView: View{
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var  colorScheme
    var body: some View{
        ZStack{
            Color(colorScheme == .light ? Color.background : Color.clear).ignoresSafeArea(.all)
            NavigationStack{
                VStack(spacing: 16) {
                    Text("test")
                        .font(.custom(languageManager.getFont(), size: 32))
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: NotificationView()) {
                            Image(systemName: "bell")
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
