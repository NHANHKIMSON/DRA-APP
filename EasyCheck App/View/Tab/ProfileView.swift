import SwiftUI
struct ProfileView: View{
    @EnvironmentObject var language: LanguageManager
    @StateObject private var viewModel = UserViewModel()
    var body: some View {
        NavigationView {
            Group {
                Text("NEw")
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Text("Profile")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(LanguageManager.shared)
}


//.onAppear {
//                for family in UIFont.familyNames.sorted() {
//                    print("Family: \(family)")
//                    for name in UIFont.fontNames(forFamilyName: family).sorted() {
//                        print("   \(name)")
//                    }
//                }
//            }
