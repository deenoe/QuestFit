//
//  RegistrationView.swift
//  QuestFit
//
//  Created by Miguel Bunag on 3/1/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [accentColor, .white]), center: .center, startRadius: 0, endRadius: 3000) // Adjust the endRadius as needed
                .ignoresSafeArea()
            VStack{
                Image("frodge3")
                    .resizable()
                    .scaledToFill()
                    .frame(width:200, height: 150)
                    .padding(.vertical, 32)
                VStack (spacing:24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "frog@email.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $username,
                              title: "Display Name",
                              placeholder: "Enter Your Display Name")
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    ZStack(alignment: .trailing){
                        InputView(text: $confirmPassword,
                                  title: "Confirm Password",
                                  placeholder: "Confirm your password",
                                  isSecureField: true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty{
                            if password == confirmPassword{
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else{
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                        }
                    }
                }
                .padding(.top, 12)

                Button {
                    Task {
                        try await viewModel.createUser(withEmail:email,
                                                       password: password,
                                                       username: username)
                    }
                } label: {
                    HStack{
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(mainColor)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 :0.7)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                Button{
                    dismiss()
                } label: {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .opacity(0.8)
                .font(.system(size:14))
                .padding(.bottom, 16)
            }
            .padding(.horizontal)
            .monospaced()
            .foregroundStyle(mainColor)
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count>5
        && !username.isEmpty
        && confirmPassword == password
    }
}

#Preview {
    RegistrationView()
}
