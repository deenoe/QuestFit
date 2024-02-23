import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSignedUp: Bool = false

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 42)
            
            VStack(spacing: 16.0) {
                TextField("Username", text: $username)
                    .padding()
                    .border(Color.gray)
                
                SecureField("Password", text: $password)
                    .padding()
                    .border(Color.gray)
            }
            .padding(.bottom, 16)
            
            // Removed the empty Button
            
            NavigationLink(destination: HomeView(), isActive: $isSignedUp) {
                EmptyView()
            }
            .navigationBarBackButtonHidden(true)
            
            Button(action: {
                // Trigger saveCredentials() when Sign Up is tapped
                saveCredentials()
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .disabled(username.isEmpty || password.isEmpty)
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
