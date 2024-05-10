//
//  LeaderboardView.swift
//  QuestFit-new
//
//
import SwiftUI
import FirebaseFirestoreSwift

struct LeaderboardView: View {
    
    @ObservedObject private var viewModel = LeaderboardViewModel()
     
    var body: some View {
        //let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
        //let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
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
        /*
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .monospaced()
                .foregroundColor(mainColor)
            
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(viewModel.leaderboardEntries) { entry in
                        HStack {
                            Text(entry.username)
                            Spacer()
                            Text("Level: \(entry.level)")
                        }
                        .foregroundStyle(.white)
                        .monospaced()
                        .padding(.horizontal)
                        .frame(height: 50) // Set a fixed height for each cell
                        .background(mainColor)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(accentColor)
         */
    }
}



 struct Leaderboard_Preview: PreviewProvider{
 static var previews: some View {
 LeaderboardView()
 }
 
 }
 

