import Foundation
enum Appearance: String, CaseIterable, Identifiable{
    case system = "System"
        case light = "Light"
        case dark = "Dark"
        
        var id: String { self.rawValue }
}
