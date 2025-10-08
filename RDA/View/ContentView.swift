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
                NotificationView()
                    .tabItem {
                        Image(systemName: "bell")
                        Text("notification")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("profile")
                    }
            }
            .tint(Color("Prime"))
            .font(.custom("Noto Sans-Thin", size: 32))
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
