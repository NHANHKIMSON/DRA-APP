import SwiftUI
struct ProfileView: View{
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        GeometryReader{ geo in
            Text("Profile View")
                .font(.custom(languageManager.getFont(), size: 32))
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}
