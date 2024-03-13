import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    
    var body: some View {
        if let user = viewModel.currentUser{
            ZStack {
                Color(accentColor)
                    .ignoresSafeArea()
                VStack {
                    // Top section
                    HStack{
                        Spacer()
                        ZStack (alignment: .center){ // Align everything to the center of the ZStack
                            Image(systemName: "shield.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(mainColor)
                            Text("\(user.level)")
                                .font(.system(size:16))
                                .monospaced()
                                .bold()
                                .foregroundColor(accentColor)
                                .multilineTextAlignment(.center) // Center the text within its bounding box
                        }
                        .padding(.horizontal)
                        Spacer()
                        VStack {
                            Image("frodge3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 128, height: 128)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(mainColor), lineWidth: 6))
                                .shadow(radius: 20)
                                .offset(x:-5)
                            Text(user.username)
                                .monospaced()
                                .bold()
                                .font(.system(size:20))
                                .foregroundStyle(mainColor)
                                .offset(x:-5)
                        }
                        .padding(.horizontal)
                        
                        VStack{ // Stacks Settings and locations
                            Button(action: {
                                viewModel.signOut()
                                // Implement action for settings button
                            }) {
                                Image(systemName: "gear")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .monospaced()
                                    .foregroundStyle(mainColor)
                                    .offset(x:-6)
                            }
                        }
                        .padding(.horizontal)
                        Spacer()
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
                            .environmentObject(viewModel)
                            .tabItem{
                                Label("Leaderboards", systemImage: "trophy")
                            }
                        
                    }
                    .padding()
                    .accentColor(mainColor)
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews : some View {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}
