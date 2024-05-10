//
//  LeaderboardView.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
//
import SwiftUI
import FirebaseFirestoreSwift

struct LeaderboardView: View {
    
    @ObservedObject private var viewModel = LeaderboardViewModel()
     
    var body: some View {
        VStack(alignment: .leading){
            Text("Most Honored")
                .font(.title)
                .bold()
                .monospaced()
                .padding()
                .foregroundStyle(.indigo)
            NavigationView{
                List(viewModel.users){ users in
                    VStack(alignment: .leading) {
                        Text(users.username)
                            .font(.headline)
                            .monospaced()
                        Text("Valor: \(users.level)")
                            .font(.subheadline)
                            .monospaced()
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.0423)
                    .foregroundStyle(.indigo)
                    .listRowBackground(Color.white)
                }
                .scrollContentBackground(.hidden)
                .background(.indigo)
                
                .onAppear(){
                    self.viewModel.fetchData()
                }
            }
            .padding(.bottom,7)
        }
    }
}



 struct Leaderboard_Preview: PreviewProvider{
 static var previews: some View {
 LeaderboardView()
 }
 
 }
 

