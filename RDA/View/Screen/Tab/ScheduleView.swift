import SwiftUI
struct ScheduleView: View{
    @EnvironmentObject var language: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    @State var date: Date = Date.now
    var body: some View{
        ScrollView{
            VStack {
                DatePicker(selection: $date, label: {
                    Text("Date")
                })
                .datePickerStyle(.graphical)
                Text("Schedule")
                    .font(.custom(language.getFont(), size: 32))
            }
        }
    }
}

#Preview {
    ScheduleView()
        .environmentObject(LanguageManager.shared)
}
