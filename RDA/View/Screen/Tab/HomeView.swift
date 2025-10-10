import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isUnlocked: Bool
    
    var body: some View {
        ScrollView{
            NavigationStack {
                ZStack {
                    Color(colorScheme == .light ? Color.background : Color.clear)
                        .ignoresSafeArea(.all)
                    
                    VStack(spacing: 16) {
                        
                        Text("You need to unluck: \(String(describing: isUnlocked))")
                        
                        Text("test")
                            .font(.custom(languageManager.getFont(), size: 32))
                    }
                    .padding(.horizontal)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: NotificationView().navigationBarBackButtonHidden(true)) {
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
