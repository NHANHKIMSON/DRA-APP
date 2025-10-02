//
//  ContentView.swift
//  EasyCheck App
//
//  Created by Apple on 10/1/25.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                TabView(){
                    UserListView()
                        .tabItem{
                            Image(systemName: "house")
                            Text("home")
                        }
                    HomeView()
                        .tabItem{
                            Image(systemName: "clock")
                            Text("history")
                        }
                    ScheduleView()
                        .tabItem{
                            Image(systemName: "bell")
                            Text("schedule")
                        }
                    NotificationView()
                        .tabItem{
                            Image(systemName: "bell")
                            Text("notification")
                        }
                    ProfileView()
                        .tabItem{
                            Image(systemName: "person")
                            Text("profile")
                        }
                }
                .tint(Color("PrimaryColor"))
                .font(.custom("Noto Sans-Thin", size: 32))
            }
        }
        .navigationTitle("NEw")
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
