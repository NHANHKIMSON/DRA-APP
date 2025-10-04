import SwiftUI
class LanguageManager: ObservableObject {
    @Published var currentLocale: Locale = .init(identifier: "en") {
          didSet {
              UserDefaults.standard.set(currentLocale.identifier, forKey: "appLanguage")
          }
      }
    static let shared = LanguageManager()
    
    func setLanguage(_ code: String) {
        currentLocale = Locale(identifier: code)
        UserDefaults.standard.set(code, forKey: "appLanguage")
    }
    
    func getFont()-> String{
        switch currentLocale.identifier{
        case "km": return "KantumruyPro-Regular"   // Khmer font
        case "ko": return "NotoSansKR-Regular"     // Korean font
        default:   return "NotoSans-Regular"       // English font
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.string(forKey: "appLanguage") {
            currentLocale = Locale(identifier: saved)
        }
    }
}
/*
 
 EasyCheck_App/
 ├── Models/
 │   ├── User.swift
 │   ├── TabModel.swift
 │   └── [Other Models]
 ├── Services/
 │   ├── Protocols/
 │   │   └── UserServiceProtocol.swift
 │   ├── Implementations/
 │   │   └── UserServiceImpl.swift
 │   └── [Other Services]
 ├── ViewModels/
 │   ├── UserViewModel.swift
 │   ├── HomeViewModel.swift
 │   ├── ProfileViewModel.swift
 │   └── [Other ViewModels]
 ├── Views/
 │   ├── Components/
 │   │   ├── CustomButtonStyle.swift
 │   │   ├── LanguagePicker.swift
 │   │   └── [Other Components]
 │   ├── Pages/
 │   │   ├── SignupPage.swift
 │   │   ├── HomeView.swift
 │   │   ├── ProfileView.swift
 │   │   └── [Other Pages]
 │   └── Tabs/
 │       ├── HistoryView.swift
 │       ├── ScheduleView.swift
 │       └── [Other Tab Views]
 ├── Utils/
 │   ├── LanguageManager.swift
 │   ├── Constants.swift
 │   └── Extensions/
 ├── Helpers/
 └── Resources/
*/
