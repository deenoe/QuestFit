//
//  ContentView.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/2/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        }
        else{
            LoginView()
            Spacer()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
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
}

#Preview {
    MainView()
}
