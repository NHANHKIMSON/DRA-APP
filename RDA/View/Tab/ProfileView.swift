import SwiftUI
struct ProfileView: View{
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        VStack{
            ColorSchemePicker()
            LanguagePicker()
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}
