//
//  RegisterView.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Registration",
                       subtitle: "Your Journey Begins Here",
                       angle: -15,
                       background: Color.cyan)
            .offset(y:-40)
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(
                    title: "Register",
                    background: .cyan
                ){
                    viewModel.register()
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .cornerRadius(8)
            .offset(y: -145)
        
        }
        .background(.indigo)
      

    }
}

#Preview {
    RegisterView()
}
