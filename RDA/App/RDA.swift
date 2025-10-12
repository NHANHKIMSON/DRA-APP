import SwiftUI
@main
struct RDA: App {
    @StateObject var languageManager = LanguageManager.shared
    @AppStorage("appearance") private var selectedAppearance: Appearance = .system
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var auth = Authentication.shared
        var colorScheme: ColorScheme? {
            switch selectedAppearance {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return nil
            }
        }
    var body: some Scene {
        WindowGroup {
//            if auth.loggedIn{
                ContentView()
                    .environmentObject(languageManager)
                    .environment(\.locale, languageManager.currentLocale)
                    .preferredColorScheme(colorScheme)
                    .onAppear{
                        UNUserNotificationCenter.current().delegate = appDelegate
                    }
//            }else{
//                LoginView()
//            }
        }
    }
}
