import SwiftUI
@main
struct EasyCheck_AppApp: App {
    @StateObject var languageManager = LanguageManager.shared
    @AppStorage("appearance") private var selectedAppearance: Appearance = .system
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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
            ContentView()
                .environmentObject(languageManager)
                .environment(\.locale, languageManager.currentLocale)
                .preferredColorScheme(colorScheme)
                .onAppear{
                    UNUserNotificationCenter.current().delegate = appDelegate
                }
        }
    }
}
