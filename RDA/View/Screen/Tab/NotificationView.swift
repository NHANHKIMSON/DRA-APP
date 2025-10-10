import SwiftUI
struct NotificationView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var languageManager: LanguageManager
    @State var description: String = "Dear teacher SOK POLEN and teacher Von Tavan my name is Cody from BTB class I would like to ask permission for afternoon shift as I am experiencing a high fever. Thank you for your understanding teacher."
    var body: some View {
        ZStack {
            Color(colorScheme == .light ? Color.background : Color.clear)
                .ignoresSafeArea(.all)
            ScrollView{
                NotificationMessage(description: $description)
            }
            .padding(.horizontal)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                    })
                    .buttonStyle(CustomButtonStyle())
                }
                ToolbarItem(placement: .principal){
                    Text("Notifications")
                }
            }
        }
    }
}
#Preview {
    NotificationView()
        .environmentObject(LanguageManager.shared)
}
#Preview {
    ContentView()
        .environmentObject(LanguageManager.shared)
}


struct NotificationMessage: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Binding var description: String
//    @State var isSelected =  Date()
    
    var body: some View {
        HStack{
            HStack{
                Image("student2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                    .cornerRadius(100)
            }
            VStack(alignment: .leading){
                Text("ធន់ ម៉េងសែ - Thun Mengse")
                    .font(.custom(languageManager.getFont(), size: 14))
                Text(description)
                    .lineLimit(2)
                    .font(.custom(languageManager.getFont(), size: 10))

            }
        }
        .padding()
        .background(.secon.opacity(0.2))
        .cornerRadius(8)

    }
}

struct message: Identifiable{
    var id = UUID()
    var name: String
    var description: String
}


struct NotificationMessageDetails: View {
    @Binding var description: String
    var body: some View {
        ScrollView{
            VStack{
                TextEditor(text: $description)
            }
        }
    }
}

