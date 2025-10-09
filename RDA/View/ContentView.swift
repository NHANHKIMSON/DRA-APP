import SwiftUI

struct ContentView: View {
    @EnvironmentObject var language: LanguageManager
    @State private var selectedTab = 0
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Group {
                    ZStack{
                        Color(colorScheme == .light ? Color.background : Color.clear).ignoresSafeArea(.all)
                        
                        switch selectedTab {
                        case 0:
                            HomeView()
                        case 1:
                            ScheduleView()
                        case 2:
                            EmptyView()
                        case 3:
                            AttendenceView()
                        case 4:
                            ProfileView()
                        default:
                            HomeView()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                CustomTabBar(selectedTab: $selectedTab) {
                    performFaceIDAction()
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }
    }
    
    private func performFaceIDAction() {
        print("Face ID button tapped!")
    }
}

#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
