//
//  RegisterView.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Register",
                       subtitle: "Organize Your Days",
                       angle: -15,
                       background: Color.gray)
            .padding(.top, 25)
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
                    background: .black
                ){
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -85)
           
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
