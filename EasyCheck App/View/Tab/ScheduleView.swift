//
//  Schedule.swift
//  EasyCheck App
//
//  Created by Apple on 10/2/25.
//

import SwiftUI
struct ScheduleView: View{
    @State var date: Date = Date.now
    var body: some View{
        VStack {
            DatePicker(selection: $date, label: {
                Text("Date")
            })
            .datePickerStyle(.graphical)
            .environment(\.font, .custom("NotoSans-Regular", size: 16))
        }
    }
}

#Preview {
    ScheduleView()
        .environmentObject(LanguageManager.shared)
}
