//
//  signUpView.swift
//  QuestFit
//
//  Created by Max Lopez on 2/22/24.
//

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
                firstLogInView(data: $username, title: "Username")
                firstLogInView(data: $password, title: "Password")
            }
            .padding(.bottom, 16)
            
            Button(action: {
                // Save username and password here
                saveCredentials()
                // Set isSignedUp to true to trigger navigation
                isSignedUp = true
            }) {
                
            }
            .padding()
            .disabled(username.isEmpty || password.isEmpty)
            
            NavigationLink(destination: HomeView()){
                Text("Sign Up")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            .navigationBarBackButtonHidden(true)
        }
    }
    
     private func saveCredentials() {
         // Save username and password to UserDefaults
         UserDefaults.standard.set(username, forKey: "username")
         UserDefaults.standard.set(password, forKey: "password")
         
         // Set isSignedUp to true to trigger navigation
         isSignedUp = true
     }

}

