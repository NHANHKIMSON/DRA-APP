import SwiftUI

struct ContentView: View {
    var biometricManager = BiometricManager.shared
    
    @EnvironmentObject var language: LanguageManager
    @State private var selectedTab = 0
    @Environment(\.colorScheme) var colorScheme
    @State var checkBio = true
    
    @State var isUnlockBio: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Main content
                ZStack {
                    Color(colorScheme == .light ? Color.background : Color.clear).ignoresSafeArea(.all)
                    
                    switch selectedTab {
                    case 0:
                        HomeView(isUnlocked: $isUnlockBio)
                    case 1:
                        ScheduleView()
                    case 2:
                        EmptyView()
                    case 3:
                        AttendenceView()
                    case 4:
                        ProfileView()
                    default:
                        HomeView(isUnlocked: $isUnlockBio)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Custom Tab Bar at very bottom
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab, checkBio: $checkBio) {
                        // Reset unlock state before each scan attempt
                        isUnlockBio = false
                        
                        biometricManager.workwithbio {
                            isUnlockBio = true
                            print("Biometric authentication successful!")
                        }
                    }
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
            .onAppear{
                if biometricManager.isSupportBiometric(){
                    switch biometricManager.biometricType(){
                    case .faceID:
                        print("FaceID")
                        self.checkBio = true
                        break;
                    case .touchID:
                        print("TouchID")
                        self.checkBio = false
                        break;
                    default:
                        break;
                    }
                    
                }else{
                    print("device not support biometric!")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
