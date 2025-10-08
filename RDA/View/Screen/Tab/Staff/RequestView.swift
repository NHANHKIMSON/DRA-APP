import SwiftUI
import Foundation

struct RequestView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(colorScheme == .light ? Color.background : Color.clear)
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 16) {
                    Text("Request View")
                        .font(.custom(languageManager.getFont(), size: 32))
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(LanguageManager.shared)
}
