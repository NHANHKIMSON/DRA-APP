import SwiftUI
import UIKit
struct ProfileView: View{
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var viewModel = UserViewModel()
    
    @State var isPushNotification: Bool = false
    @State var isShowChangeLanguage: Bool = false
    
//    
//    @State var icon: String? =  nil
//    @State var name: String? = nil
//    @State var description: String? = nil
//    
    
    var body: some View {
        NavigationStack{
            List{
                Section("Settings"){
                    Toggle(isOn: $isPushNotification, label: {
                        ListItem(icon: "bell", name: "Push notification", description: "Allow permmision to get more information")
                    })
                    .tint(.prime)

                    Button {
                        isShowChangeLanguage = true
                    } label: {
                        ListItem(icon: "globe", name: "Language", description: "Choose your preferred language")
                    }
                    .buttonStyle(PlainButtonStyle())             .sheet(isPresented: $isShowChangeLanguage) {
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
        VStack{
            Text("Languages")
                .font(.custom(languageManager.getFont(), size: UIFont.preferredFont(forTextStyle: .title1).pointSize))
        }
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
    }
}



#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}


//                    ColorSchemePicker()
//                    LanguagePicker()
//                    Button("Logout") {
//                        Authentication.shared.logout()
//                    }

struct ListItem: View {
    @EnvironmentObject var languageManager: LanguageManager
    @State var icon: String?
    @State var name: String?
    @State var description: String?
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: icon ?? "exclamationmark.magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading){
                Text(name ?? "Unknown")
                    .font(.custom(languageManager.getFont(), size: UIFont.preferredFont(forTextStyle: .headline).pointSize))
                Text(description ?? "Unknown")
                    .font(.custom(languageManager.getFont(), size: UIFont.preferredFont(forTextStyle: .caption1).pointSize))
                    .foregroundStyle(.gray)
            }
        }
    }
}

