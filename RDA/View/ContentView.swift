import SwiftUI

struct ContentView: View {
    @EnvironmentObject var language: LanguageManager
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Group {
                    switch selectedTab {
                    case 0: HomeView()
                    case 1: RequestView()
                    case 2: AttendenceView()
                    case 3: ProfileView()
                    default: HomeView()
                    }
                }
                
                // Custom Tab Bar
                VStack {
                    Spacer()
                    HStack {
                        ForEach(0..<5, id: \.self) { index in
                            if index == 2 {
                                Button(action: {
                                    performFaceIDAction()
                                }) {
                                    VStack {
                                        Image(systemName: "faceid")
                                            .font(.title2)
                                        Text("faceid")
                                            .font(.caption)
                                    }
                                    .foregroundColor(Color("Prime"))
                                }
                                .frame(maxWidth: .infinity)
                            } else {
                                let tabIndex = index > 2 ? index - 1 : index
                                Button(action: {
                                    selectedTab = tabIndex
                                }) {
                                    VStack {
                                        Image(systemName: tabIcon(for: tabIndex))
                                            .font(.title2)
                                        Text(tabTitle(for: tabIndex))
                                            .font(.caption)
                                    }
                                    .foregroundColor(selectedTab == tabIndex ? Color("Prime") : .gray)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .background(.white)
                }
            }
        }
    }
    
    private func tabIcon(for index: Int) -> String {
        switch index {
        case 0: return "house"
        case 1: return "calendar"
        case 2: return "apple.books.pages.fill"
        case 3: return "person"
        default: return "house"
        }
    }
    
    private func tabTitle(for index: Int) -> String {
        switch index {
        case 0: return "home"
        case 1: return "Request"
        case 2: return "Attendence"
        case 3: return "profile"
        default: return "home"
        }
    }
    
    private func performFaceIDAction() {
        print("FaceID action performed!")
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
