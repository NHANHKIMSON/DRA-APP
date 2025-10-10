import Foundation
import UserNotifications
class LocalNotificationManager{
    static var shared = LocalNotificationManager()
    func askPermission(){
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]){ success, error in
                if success {
                    print("Success!")
                }else{
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
    }
    
    // func for push
    func sentNotification(date: Date){
        let content = UNMutableNotificationContent()
        content.title = "Remider"
        content.subtitle = "Get up plese"
        content.sound = .default
        
        // set time to push
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        // set minit and hour
        
//        var date: DateComponents
//        date.hour = 15
//        date.minute = 59
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        // request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // add request to notification center
        UNUserNotificationCenter.current().add(request)
    }
}
