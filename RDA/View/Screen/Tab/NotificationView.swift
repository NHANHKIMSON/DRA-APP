import SwiftUI
struct NotificationView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isSelected =  Date()
    var body: some View {
            ZStack {
                Color(colorScheme == .light ? Color.background : Color.clear)
                    .ignoresSafeArea(.all)
                ScrollView{
                VStack {
                    DatePicker("Select Date", selection: $isSelected)
                    Button {
                        //                LocalNotificationManager.shared.sentNotification()
                    } label:  {
                        Text("Push")
                    }
                    
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
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
