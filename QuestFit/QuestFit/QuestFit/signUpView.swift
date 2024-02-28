import SwiftUI
import Foundation

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSignedUp: Bool = false

    
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    

    var body: some View {
        ZStack{
            Color(accentColor)
                .ignoresSafeArea()
        VStack {
            Text("Create Account")
                .monospaced()
                .font(.largeTitle)
                .fontWeight(.bold)
            VStack(spacing: 16.0) {
                TextField("Username", text: $username)
                    .padding()
                    .foregroundColor(mainColor)
                    .bold()
                    .frame(width: 350, height: 30)
                    .cornerRadius(2)
                    .monospaced()
                    .border(.white)
                    .background(.white)
                SecureField("Password", text: $password)
                    .padding()
                    .foregroundColor(mainColor)
                    .bold()
                    .frame(width: 350, height: 30)
                    .cornerRadius(2)
                    .monospaced()
                    .border(.white)
                    .background(.white)
            }
            .padding(.bottom, 16)
            NavigationLink(destination: HomeView(), isActive: $isSignedUp) {
                EmptyView()
            }
            .navigationBarBackButtonHidden(true)
            
            Button(action: {
                // Trigger saveCredentials() when Sign Up is tapped
                saveCredentials()
            }) {
                Text("Sign Up")
                    .padding()
                    .foregroundColor(mainColor)
                    .bold()
                    .frame(width: 350, height: 30)
                    .cornerRadius(20)
                    .monospaced()
                    .border(.white)
                    .background(.white)
            }
            .disabled(username.isEmpty || password.isEmpty)
            
        }
    }
    }
    
    private func saveCredentials() {
        // Save username and password to UserDefaults
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        print("saveCredentials function called")
        print("Saved username: ", username)
        print("Saved password: ", password)

        // Set isSignedUp to true to trigger navigation
        isSignedUp = true
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View{
        SignUpView()
    }
}
