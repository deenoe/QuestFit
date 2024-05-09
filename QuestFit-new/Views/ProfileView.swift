//
//  ProfileView.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var selectedTitleIndex = 0
    //@State private var selectedProfile = 0
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle(Text("\(viewModel.user?.name ?? "User")'s Profile"))
        }
        .onAppear(){
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user:User) -> some View{
        // Avatar
//        Button(action: {
//                // Perform action when profile picture is clicked (e.g., show picker)
//                // You can add your logic here to show the picker for selecting profile photo
//            }) {
//                if let selectedPhoto = viewModel.selectedPhoto {
//                    selectedPhoto // Use the selected photo if available
//                        //.resizable()
//                        //.aspectRatio(contentMode: .fit)
//                       // .foregroundColor(Color.blue)
//                        //.frame(width: 125, height: 125)
//                        //.padding()
//                } else {
//                    Image(systemName: "person.circle") // Use default profile picture if no photo selected
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(Color.blue)
//                        .frame(width: 125, height: 125)
//                        .padding()
//                }
//            }
        VStack {
                // Picker to select a title from the beginner titles array
            Picker("Select Title", selection: $selectedTitleIndex) {
                        ForEach(0..<viewModel.availableTitles.count, id: \.self) { index in
                            Text(viewModel.availableTitles[index]).tag(index)
                        }
                    } 

                .pickerStyle(DefaultPickerStyle())
                .padding()
                }
        // Info
        VStack(alignment: .leading){
            
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
            }
            HStack{
                Text("Valor: ")
                    .bold()
                Text("\(user.userLevel)")
            }
        }
        Button("Sign Out"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
    
    }
}
        

#Preview {
    ProfileView()
}


/*
 Replace profile with user name uptop
 icon showing avatar
 Title right below
 valor
 pickable color
 
 */
