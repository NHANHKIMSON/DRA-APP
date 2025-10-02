import SwiftUI
struct SignupPage: View{
    @State var email: String = ""
    @State var password: String = ""
    var body: some View{
        ZStack{
            Color.blue
                .ignoresSafeArea(.all)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Hello welcome to RDA!")
                            .font(.title)
                        Text("Sign up to continue")
                            .font(.title3)
                            .opacity(0.6)
                    }
                    Spacer()
                }
                Spacer()
                VStack{
                    TextField("Enter Email", text: $email)
                    TextField("Enter Pass", text: $password)
                }
                .background(Color.white)
            }
        }
    }
}

#Preview {
    SignupPage()
}
