//  ProfileView.swift
//  Questfit
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var selectedTitleIndex = 0
    @State private var selectedImageIndex = 0

    var body: some View {
        NavigationView{
            ZStack{
                Color.indigo
                VStack{
                    if let user = viewModel.user{
                        profile(user: user)
                            .padding()
                        
                    } else {
                        Text("Loading Profile...")
                    }
                }
            }
        }
        .onAppear(){
            viewModel.fetchUser()
        }

    }
    @ViewBuilder
    func profile(user:User) -> some View{
        Text(user.name)
            .monospaced()
            .foregroundColor(.white)
            .bold()
            .font(.largeTitle)
        VStack(alignment: .center) {
            Image("helmet") // Use default profile picture if no photo selected
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.blue)
                                    .frame(width: 150, height: 175)
                                .padding()
        }
        
        VStack {
           // Picker to select a title from the titles array
            Picker("Select Title", selection: $selectedTitleIndex) {
                        ForEach(0..<viewModel.availableTitles.count, id: \.self) { index in
                            Text(viewModel.availableTitles[index]).tag(index)
                        }
                    }
                .accentColor(.orange)
                .pickerStyle(DefaultPickerStyle())
                }
        
        // Info
        VStack(alignment: .leading){
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Here Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
            }
            .padding()
            HStack{
                Text("Valor: ")
                    .bold()
                Text("\(user.userLevel)")
            }
            .padding()
        }
        .foregroundColor(.white)
        .font(.system(size:18))
        .bold()
        Button("Sign Out"){
            viewModel.logOut()
        }
        .tint(.white)
        .monospaced()
        .bold()
        .cornerRadius(8)
        .background(.red)
        .padding()
    
    }
        
}
        

#Preview {
    ProfileView()
}
