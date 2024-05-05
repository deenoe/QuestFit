//
//  LoginView.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {       
        NavigationView{
                VStack{
                    // Header
                    HeaderView(title: "QuestFit",
                               subtitle:"A Gamified Workout Journey",
                               angle: 15,
                               background: Color.cyan)
                    .padding(.top, 25)
                    // Login Form
                    Form {
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TLButton(
                            title:"Login",
                            background: .cyan
                        ){
                            viewModel.login()
                        }
                    }
                    .frame(width:UIScreen.main.bounds.width * 0.8)
                    .cornerRadius(8)
                    .offset(y:-80)
                    
                    // Create Account
                    VStack{
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                        Text("New user?")
                            .foregroundStyle(.white)
                        NavigationLink("Create an Account", destination: RegisterView())
                            .foregroundColor(.white)
                    }
    
                    .padding(.bottom, 20)
                    Spacer()
                }
            
        .background(Color.blue.colorScheme(.dark))
        .ignoresSafeArea()
            }
        }
}
    
    struct LoginView_Previews: PreviewProvider{
        static var previews: some View{
            LoginView()
        }
    }
