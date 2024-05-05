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
                    HeaderView(title: "Raccoon Remind",
                               subtitle:"Get Things Done.",
                               angle: 15,
                               background: Color.gray)
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
                            background: .black
                        ){
                            viewModel.login()
                        }
                    }
                    .offset(y:-50)
                    
                    // Create Account
                    VStack{
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                        Text("New user?")
                        NavigationLink("Create an Account", destination: RegisterView())
                            .foregroundColor(.blue)
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                }
            }
        }
}
    
    struct LoginView_Previews: PreviewProvider{
        static var previews: some View{
            LoginView()
        }
    }
