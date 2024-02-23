//
//  HomeView.swift
//  QuestFit
//
//  Created by Max Lopez on 2/23/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View{
        VStack {
            // Top section
            HStack {
                
                Image("frodge")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5)
                Text("Current Level: 1")
                Spacer() // Spacer pushes the following views to the right
                VStack{// Stacks Settings and locations
                    Button(action: {
                    // Implement action for settings button
                }) {
                    Text("Settings")
                }
                    Button(action: {
                        // Implement action for location button
                    }) {
                        Text("Location")
                    }
                }
            }
            .padding()
            
            // Middle section with main content
            TabView{
                DailyQuestsView()
                    .tabItem{
                        Label("Daily Quest", systemImage: "sun.max.fill")
                    }
                WorkoutLogView()
                    .tabItem{
                        Label("Work Out Log", systemImage: "bolt.fill")
                    }
                LeaderboardView()
                    .tabItem{
                        Label("Leaderboards", systemImage: "sun.max.fill")
                    }
            }
                .padding()
                }
    }
}

