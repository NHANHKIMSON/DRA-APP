import SwiftUI
struct ProfileView: View{
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
            ZStack{
                Color(colorScheme == .light ? Color.background : Color.clear).ignoresSafeArea(.all)
                VStack{
                ColorSchemePicker()
                LanguagePicker()
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}
