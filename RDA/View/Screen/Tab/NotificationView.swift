import SwiftUI
struct NotificationView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isSelected =  Date()
    var body: some View {
        ZStack{
            Color
                .background
                .ignoresSafeArea(.all)
            VStack {
                DatePicker("Select Date", selection: $isSelected)
                
                Button {
                    //                LocalNotificationManager.shared.sentNotification()
                    
                    
                    
                } label: {
                    if #available(iOS 26.0, *) {
                        Text("Push")
                            .padding()
                    } else {
                        // Fallback on earlier versions
                    }
                    
                }
                //            .buttonStyle(CustomButton())
                
            }
            .padding()
            .onAppear{
                LocalNotificationManager.shared
                    .askPermission()
            }
            .onChange(of: isSelected) { _, newValue in
                LocalNotificationManager.shared.sentNotification(date: newValue)
            }
            
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
