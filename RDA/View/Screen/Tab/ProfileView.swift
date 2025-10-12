import SwiftUI
import UIKit
struct ProfileView: View{
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var viewModel = UserViewModel()
    
    @State var isPushNotification: Bool = false
    @State var isShowChangeLanguage: Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                Section("Settings"){
                    Toggle(isOn: $isPushNotification, label: {
                        ListItem(
                            icon: "bell",
                            name: "languages",  // key from Localizable.strings
                            description: "Allow permission to get more information"
                        )
                        .environmentObject(LanguageManager.shared)
                    })
                    .tint(.prime)

                    Button {
                        isShowChangeLanguage = true
                    } label: {
                        ListItem(icon: "globe", name: "Language", description: "Choose your preferred language")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isShowChangeLanguage) {
                        ChanngeLanguageItem()
                    }

                    NavigationLink{
                        Text("")
                    } label: {
                        ListItem(icon: "key", name: "Change Password", description: "You can change your current password")
                    }
                }
            }
            .background(Color.background)
            .scrollContentBackground(.hidden)
            .listRowSpacing(10)
            .navigationTitle("Profile")
        }
    }
}


struct ChanngeLanguageItem: View {
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        VStack(alignment: .center, spacing: 16){
            Text("languages")
                .font(.custom(languageManager.getFont(), size: UIFont.preferredFont(forTextStyle: .title1).pointSize))
                .fontWeight(.semibold)
            HStack{
                Text(languageManager.localizedString(forKey: "please_select_a_display_languages"))
                Spacer()
            }
            LanguagePicker()
            Spacer()
        }
        .padding([.horizontal, .top])
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
    }
}

#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}

struct ListItem: View {
    @EnvironmentObject var languageManager: LanguageManager
    var icon: String?
    var name: String
    var description: String?
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon ?? "exclamationmark.magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading) {
                Text(languageManager.localizedString(forKey: name))
                    .font(.custom(languageManager.getFont(),
                                  size: UIFont.preferredFont(forTextStyle: .headline).pointSize))
                
                if let desc = description {
                    Text(languageManager.localizedString(forKey: desc))
                        .font(.custom(languageManager.getFont(),
                                      size: UIFont.preferredFont(forTextStyle: .caption1).pointSize))
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}
