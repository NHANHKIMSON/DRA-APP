//import SwiftUI
//import Foundation
//class LanguageManager: ObservableObject {
//    @Published var local: Locale = Locale(identifier: AppLanguage.english.rawValue)    
//}
import SwiftUI
class LanguageManager: ObservableObject {
    @Published var currentLocale: Locale = .init(identifier: "en")
    
    static let shared = LanguageManager()
    
    func setLanguage(_ code: String) {
        currentLocale = Locale(identifier: code)
        UserDefaults.standard.set(code, forKey: "appLanguage")
    }
    
    init() {
        if let saved = UserDefaults.standard.string(forKey: "appLanguage") {
            currentLocale = Locale(identifier: saved)
        }
    }
}
