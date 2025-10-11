import SwiftUI
struct AttendenceView: View{
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            Color(colorScheme == .light ? Color.background : Color.clear).ignoresSafeArea(.all)
            VStack{
                HStack{
                    Image("")
                }
                
                Text("")
                    .font(.custom(languageManager.getFont(), size: 32))
            }
        }
    }
}
#Preview {
    AttendenceView()
        .environmentObject(LanguageManager.shared)
}
