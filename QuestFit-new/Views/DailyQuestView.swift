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
                                .frame(height: UIScreen.main.bounds.width * 0.15)
                            Spacer()
                            Text("\(workout.exp) PTS")
                            Button {
                                if !QuestManager.shared.isQuestCompletedToday(questId: workout.id) {
                                    print("updating user level")
                                    userModel.updateUserLevel(newLevel: user.userLevel + workout.exp)
                                    userModel.fetchUser()
                                    QuestManager.shared.markQuestAsCompleted(questId: workout.id)
                                }
                            } label: {
                                if QuestManager.shared.isQuestCompletedToday(questId: workout.id) {
                                    Image(systemName: "checkmark.circle.fill")
                                } else {
                                    Image(systemName: "circle")
                                }
                            }
                            .disabled(QuestManager.shared.isQuestCompletedToday(questId: workout.id))
                        }
                        .opacity(QuestManager.shared.isQuestCompletedToday(questId: workout.id) ? 0.5 : 1.0)


                    }
                    // .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
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
