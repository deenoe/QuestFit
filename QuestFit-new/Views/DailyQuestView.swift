//
//  DailyQuestView.swift
//  QuestFit-new
//
//  Created by Miguel Bunag on 5/4/24.
//
import SwiftUI


struct DailyQuestView: View {
    @ObservedObject var viewModel = DailyQuestViewViewModel()
    @StateObject var userModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            if let user = userModel.user {
                VStack{
                    HStack{
                        Text("Daily Quests")
                            .font(.largeTitle)
                        Spacer()
                        Text("Valor: \(user.userLevel)")
                    }
                    .padding()
                    List(viewModel.quests) { workout in
                        HStack {
                            Text(workout.exerciseName)
                                .frame(height: UIScreen.main.bounds.width*0.15)
                            Spacer()
                            Text("\(workout.exp) PTS")
                            Button{
                                print("updating user level")
                                userModel.updateUserLevel(newLevel: user.userLevel + workout.exp)
                                userModel.fetchUser()
                            } label: {
                                Image(systemName: "checkmark.circle.fill")
                            }
                        }
                    }
                    // .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
                    Button("Confirm Quests"){
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.05)
                    .border(Color.black, width: 4)
                    .foregroundStyle(.black)
                    .bold()
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(7)
                    .padding()
                    Spacer()
                }
                }
            else{
                Text ("Loading Profile..")
            }
            }
        
        .onAppear() {
            self.viewModel.fetchQuests()
            userModel.fetchUser()
        }
    }
}


 struct DailyQuestView_Previews: PreviewProvider {
     static var previews: some View{
        DailyQuestView()
     }
 }
 
