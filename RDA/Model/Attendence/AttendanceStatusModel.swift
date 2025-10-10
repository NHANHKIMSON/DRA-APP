import Foundation
class AttendanceStatusModel{
    var status: String
    var checkIn: Date?
    var checkOut: Date?
    var date: Date
    
    
    init(status: String, checkIn: Date? = nil, checkOut: Date? = nil, date: Date) {
        self.status = status
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.date = date
    }
}
