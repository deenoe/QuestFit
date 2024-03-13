//
//  LoginView.swift
//  QuestFit
//
//  Created by Miguel Bunag on 3/1/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [accentColor, .white]), center: .center, startRadius: 0, endRadius: 3000) // Adjust the endRadius as needed
                    .ignoresSafeArea()
                
                VStack{
                    // Show the frog!!
                    Image("frodge3")
                        .resizable()
                        .scaledToFill()
                        .frame(width:200, height: 150)
                        .padding(.vertical, 32)
                    VStack{
                        
                        // form fields
                        VStack (spacing:24) {
                            InputView(text: $email,
                                      title: "Email Address",
                                      placeholder: "frog@email.com")
                            .autocapitalization(.none)
                            InputView(text: $password,
                                      title: "Password",
                                      placeholder: "Enter your password",
                                      isSecureField: true)
                            .autocapitalization(.none)
                        }
                        .foregroundColor(mainColor)
                        .monospaced()
                        
                        
                        // sign in button
                        Button {
                            Task{
                                try await viewModel.signIn(withEmail: email, password: password)
                            }
                        } label: {
                            HStack{
                                Text("SIGN IN")
                                    .fontWeight(.bold)
                                Image(systemName: "arrow.right")
                                
                            }
                            .monospaced()
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                            .foregroundColor(.white)
                        }
                        .background(mainColor)
                        .disabled(!formIsValid)
                        .cornerRadius(10)
                        .opacity(formIsValid ? 1: 0.7)
                        .padding(.top, 24)
                        
                    }
                    .padding()
                    .padding(.horizontal)
                    
                    Spacer()
                    // sign up button
                    NavigationLink{
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack (spacing: 6){
                            Text("Don't have an account?")
                            Text("Sign Up!")
                                .fontWeight(.bold)
                        }
                        .foregroundStyle(mainColor)
                        .monospaced()
                        .opacity(0.8)
                        .cornerRadius(1)
                        .font(.system(size:14))
                    }
                    .padding(.bottom, 16)
                }
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count>5
    }
}

struct LoginView_Previews: PreviewProvider{
    static var previews: some View {
        LoginView()
    }
}
