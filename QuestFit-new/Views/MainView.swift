//
//  ContentView.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        }
        else{
            ZStack{
                Rectangle()
                    .fill(Color.red.opacity(0.5)) // Change color and opacity as needed
                    .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                LoginView()
                    .ignoresSafeArea()
            }
        }
    }
    @ViewBuilder
    var accountView: some View {
        ZStack{
            Color.cyan.ignoresSafeArea()
            TabView{
                Group{
                    // DailyQuestView Here
                    DailyQuestView()
                        .tabItem{
                            Label("Daily Quests", systemImage: "shield.checkered")
                        }
                    ToDoListView(userId: viewModel.currentUserId)
                        .tabItem{
                            Label("Workout Log", systemImage: "pencil.and.list.clipboard")
                        }
                    LeaderboardView()
                        .tabItem{
                            Label("Leaderboard", systemImage: "trophy")
                        }
                    ProfileView()
                        .tabItem{
                            Label("Profile", systemImage: "person.circle")
                        }
                }
            }
            .accentColor(.indigo)
        }
    }
}

#Preview {
    MainView()
}
