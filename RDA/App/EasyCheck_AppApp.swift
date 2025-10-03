import SwiftUI
@main
struct EasyCheck_AppApp: App {
    @StateObject var languageManager = LanguageManager.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(languageManager)
                .environment(\.locale, languageManager.currentLocale)
        }
    }
}
