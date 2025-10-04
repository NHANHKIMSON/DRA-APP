import SwiftUI
struct LanguagePicker: View {
    @EnvironmentObject var language: LanguageManager
    
    var body: some View {
        Picker("Language", selection: $language.currentLocale) {
            Text("English").tag(Locale(identifier: "en"))
            Text("ខ្មែរ").tag(Locale(identifier: "km"))
            Text("한국어").tag(Locale(identifier: "ko"))
        }
        .pickerStyle(.menu)
    }
}
