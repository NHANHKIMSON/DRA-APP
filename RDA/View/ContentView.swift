import SwiftUI
struct ContentView: View {
    @EnvironmentObject var language: LanguageManager
    var body: some View {
        NavigationStack {
            TabView(){
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("home")
                    }
                ScheduleView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("schedule")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("profile")
                    }
            }
            .tint(Color("PrimaryColor"))
            .font(.custom("Noto Sans-Thin", size: 32))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NotificationView()) {
                        Image(systemName: "bell")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
