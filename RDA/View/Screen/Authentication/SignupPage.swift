import SwiftUI
struct SignupPage: View{
    @State var email: String = ""
    @State var password: String = ""
    var body: some View{
        VStack{
            Text("Signup Screen")
        }
    }
}

#Preview {
    SignupPage()
}
