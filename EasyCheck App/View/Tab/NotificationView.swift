//import SwiftUI
//struct NotificationView: View{
//    var body: some View{
//        Text("History view")
//            .font(.custom("NotoSans-Regular", size: 22))
//    }
//}
#Preview {
    NotificationView()
}
import SwiftUI

struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let time: String
    let isUnread: Bool
    let icon: String
}

struct NotificationView: View {
    @State private var notifications: [NotificationItem] = [
        NotificationItem(title: "New Message",
                         message: "You received a message from Anna",
                         time: "2m ago",
                         isUnread: true,
                         icon: "envelope.fill"),
        
        NotificationItem(title: "Event Reminder",
                         message: "Concert starts at 7PM tonight 🎶",
                         time: "1h ago",
                         isUnread: false,
                         icon: "calendar"),
        
        NotificationItem(title: "Ticket Confirmed",
                         message: "Your order #12345 has been confirmed ✅",
                         time: "Yesterday",
                         isUnread: false,
                         icon: "ticket.fill")
    ]
    
    var body: some View {
            NavigationView {
                List {
                    ForEach(notifications) { notification in
                        HStack(alignment: .top, spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(Color.blue.opacity(0.15))
                                    .frame(width: 44, height: 44)
                                Image(systemName: notification.icon)
                                    .foregroundColor(.blue)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(notification.title)
                                        .font(.custom("NotoSans-Regular", size: 22))
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Text(notification.time)
                                        .font(.custom("NotoSans-Regular", size: 16))
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                Text(notification.message)
                                    .font(.custom("NotoSans-Regular", size: 16))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            
                            if notification.isUnread {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Notifications")
                .font(.custom("NotoSans-Regular", size: 22))
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}
