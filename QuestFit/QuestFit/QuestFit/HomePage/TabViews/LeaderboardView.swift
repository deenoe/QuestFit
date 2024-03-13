//
//  LeaderboardView.swift
//  QuestFit
//
//  Created by Max Lopez on 2/22/24.
//
import SwiftUI
import FirebaseFirestoreSwift

struct LeaderboardView: View {
    
    @StateObject var viewModel: LeaderboardViewModel
    
    init() {
            let authViewModel = AuthViewModel()  // You may need to inject the actual instance from your environment
            _viewModel = StateObject(wrappedValue: LeaderboardViewModel(authViewModel: authViewModel))
        }
    /*let mockLeaderboardEntries = (1...20).map { id in
        MockLeaderboardEntry(id: "\(id)", username: "User_\(id)", level: id)
    }
     */
    var body: some View {
        let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
        let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
        
        
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
    }
}

struct MockLeaderboardEntry: Identifiable {
    var id: String
    var username: String
    var level: Int
}


/*
 struct Leaderboard_Preview: PreviewProvider{
 static var previews: some View {
 LeaderboardView()
 }
 
 }
 */
