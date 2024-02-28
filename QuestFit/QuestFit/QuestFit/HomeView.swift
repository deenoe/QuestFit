import SwiftUI
import Foundation

struct HomeView: View {
    // Define a state variable for the username
    @State private var username: String = ""
    @State private var isSettingsViewPresented = false
    
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    
    var body: some View {
        ZStack {
            Color(accentColor)
            .ignoresSafeArea()
            VStack {
                // Top section
                HStack {
                    ZStack(alignment: .center) { // Align everything to the center of the ZStack
                        Image(systemName: "shield.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(mainColor)
                        Text("1")
                            .font(.largeTitle)
                            .monospaced()
                            .foregroundColor(accentColor)
                            .multilineTextAlignment(.center) // Center the text within its bounding box
                    }

                    Spacer()
                    VStack{
                        Image("frodge3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                            .offset(x:-20)
                        Text(username)
                            .offset(x:-20)
                            .bold()
                            .monospaced()
                            .font(.caption)
                            .foregroundStyle(mainColor)
                    }
                    Spacer() // Spacer pushes the following views to the right
                    VStack{// Stacks Settings and locations
                        Button(action: {
                        // Implement action for settings button
                            isSettingsViewPresented = true
                        }) {
                            Text("Settings")
                            .bold()
                            .monospaced()
                            .font(.caption)
                            .foregroundStyle(mainColor)
                            .font(.title3)
                        }
                        .sheet(isPresented: $isSettingsViewPresented) {
                                        // Present the settings view as a sheet
                                        SettingsView(isPresented: $isSettingsViewPresented)
                                    }
                        Button(action: {
                            // Implement action for location button
                        }) {
                            Text("Location")
                            .bold()
                            .monospaced()
                            .font(.callout)
                            .foregroundStyle(mainColor)
                        }
                    }
                }
                .padding()
                
                // Middle section with main content
                TabView{
                    DailyQuestsView()
                        .tabItem{
                            Label("Daily Quests", systemImage: "sun.max.fill")
                        }
                        .foregroundColor(mainColor)
                    WorkoutLogView()
                        .tabItem{
                            Label("Work Out Log", systemImage: "bolt.fill")
                        }
                    LeaderboardView()
                        .tabItem{
                            Label("Leaderboards", systemImage: "trophy")
                        }
                }
                .padding()
            }
        }
        .onAppear {
            // Retrieve the username from UserDefaults
            if let savedUsername = UserDefaults.standard.string(forKey: "username") {
                self.username = savedUsername
                print("Retrieved username:", savedUsername)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews : some View {
        HomeView()
    }
}
