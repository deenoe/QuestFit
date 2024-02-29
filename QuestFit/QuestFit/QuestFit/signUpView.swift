import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State var isSignedUp = false
    
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color(accentColor)
                    .ignoresSafeArea()
                VStack {
                    Text("Create Account")
                        .monospaced()
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    VStack(spacing: 16.0) {
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(mainColor)
                            .frame(width: 350, height: 30)
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(mainColor)
                            .frame(width: 350, height: 30)
                    }
                    .padding(.bottom, 10)
                    
                    Button {
                        UserDefaults.standard.set(username, forKey: "username")
                        UserDefaults.standard.set(password, forKey: "password")
                        isSignedUp = true
                        UserDefaults.standard.set(isSignedUp, forKey: "check")
                    } label: {
                        Text("Sign Up")
                            .padding()
                            .foregroundColor(mainColor)
                            .frame(width: 350, height: 30)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    .navigationDestination(isPresented: $isSignedUp){
                        HomeView()
                    }
                    .disabled(username.isEmpty || password.isEmpty)
                    .padding()
                    
                }}         }
        .navigationBarBackButtonHidden(true)
    }}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUpView()
        }
    }
}
    
   
