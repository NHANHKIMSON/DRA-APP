import SwiftUI
struct ProfileView: View{
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(colorScheme == .light ? Color.background : Color.clear).ignoresSafeArea(.all)
                VStack{
                    ColorSchemePicker()
                    LanguagePicker()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}
