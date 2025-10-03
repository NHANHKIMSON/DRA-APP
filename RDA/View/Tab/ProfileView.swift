import SwiftUI
struct ProfileView: View{
    @EnvironmentObject var language: LanguageManager
    
    var body: some View {
        GeometryReader{ geo in
            Text("Profile View")
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}
