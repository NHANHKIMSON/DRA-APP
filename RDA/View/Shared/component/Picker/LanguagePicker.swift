import SwiftUI

struct LanguagePickerModel: Identifiable{
    var id: Int
    var  languageTitle: String
    var  languageIcon: String
    let locale: Locale
    
    static let khmer = LanguagePickerModel(
            id: 0,
            languageTitle: "khmer",
            languageIcon: "Khmer",
            locale: Locale(identifier: "km")
        )
        
        static let english = LanguagePickerModel(
            id: 1,
            languageTitle: "english",
            languageIcon: "English",
            locale: Locale(identifier: "en")
        )
        
        static let korean = LanguagePickerModel(
            id: 2,
            languageTitle: "korean",
            languageIcon: "Korean",
            locale: Locale(identifier: "ko")
        )
        
        static var allLanguages: [LanguagePickerModel] {
            [.khmer, .english, .korean]
        }
}

struct LanguagePicker: View {
    @EnvironmentObject var languageManager: LanguageManager
    @State var selectedLanguage: Int = 0
    private let languages = LanguagePickerModel.allLanguages
    @State private var currentLocale: Locale? = nil
    var body: some View {
        VStack(spacing: 16){
            ForEach(languages){ lang in
                Button(action: {
                    currentLocale = lang.locale
                    selectedLanguage = lang.id
                }, label: {
                    LanguageSelectItem(languageTitle: lang.languageTitle, languageIcon: lang.languageIcon, id: lang.id, selectedId: selectedLanguage)
                })
                .buttonStyle(CustomButtonStyle())
            }
            Button("select"){
                if let locale = currentLocale{
                    languageManager.currentLocale = locale
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .buttonStyle(CustomButtonStyle())
            .foregroundStyle(.white)
            .background(Color.prime)
            .cornerRadius(12)
        }
        .onAppear{
            selectedLanguage = languageToIndex(lang: languageManager.currentLocale.identifier)
        }
    }
}

func languageToIndex(lang: String) -> Int{
    switch lang {
    case "km":
        return 0
    case "en":
        return 1
    case "ko":
        return 2
    default:
        return 1
    }
}



#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}


#Preview {
    LanguagePicker()
        .environmentObject(LanguageManager.shared)
}
struct LanguageSelectItem: View {
    @EnvironmentObject var languageManager: LanguageManager
    var languageTitle: String
    var languageIcon: String
    var id: Int
    var selectedId: Int
    
    var body: some View {
        HStack {
            Image(languageIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text(languageTitle == "khmer" ? "khmer" : languageTitle == "english" ? "english" : "korean")
                .font(.custom(languageManager.getFont(),
                              size: UIFont.preferredFont(forTextStyle: .body).pointSize))
            Spacer()
        }
        .padding()
        .background(id == selectedId ? Color.blue.opacity(0.1) : Color.clear)
        .cornerRadius(12)
    }
}
