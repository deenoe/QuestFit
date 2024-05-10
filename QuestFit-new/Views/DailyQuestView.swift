//
//  DailyQuestView.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
//
import SwiftUI


struct DailyQuestView: View {
    @ObservedObject var viewModel = DailyQuestViewViewModel()
    @StateObject var userModel = ProfileViewViewModel()

    var body: some View {
        ZStack{
            NavigationView {
                if let user = userModel.user {
                    VStack{
                        HStack{
                            Text("Daily Quests")
                                .font(.title3)
                                .monospaced()
                                .bold()
                            Spacer()
                            Text("Valor: \(user.userLevel)")
                                .font(.title3)
                                .monospaced()
                                .bold()
                        }
                        .foregroundStyle(.indigo)
                        .ignoresSafeArea()
                        .padding()
                        List(viewModel.quests) { workout in
                            HStack {
                                VStack(alignment: .leading){
                                    Text("\(workout.exerciseName)")
                                    Text("Sets: \(workout.setCount) x \(workout.repCount) Reps")
                                        .font(.callout)
                                }
                                
                                .foregroundStyle(.indigo)
                                Spacer()
                                Text("\(workout.exp) PTS")
                                    .font(.callout)
                                    .foregroundStyle(.indigo)
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
                                        
                                        .foregroundStyle(.indigo)
                                    } else {
                                        Image(systemName: "circle")
                                        
                                        .foregroundStyle(.indigo)
                                    }
                                }
                                .disabled(QuestManager.shared.isQuestCompletedToday(questId: workout.id))
                            }
                            .listRowBackground(Color.white)
                            .opacity(QuestManager.shared.isQuestCompletedToday(questId: workout.id) ? 0.5 : 1.0)
                            .frame(height: UIScreen.main.bounds.width * 0.15)
                            .monospaced()
                        }
                        .scrollContentBackground(.hidden)
                        .background(.indigo)
                        
                        Spacer()
                    }
                    }
                else{
                    LoginView()
                }
                }
            .onAppear() {
                self.viewModel.fetchQuests()
                userModel.fetchUser()
            }
        }
        }
}


 struct DailyQuestView_Previews: PreviewProvider {
     static var previews: some View{
        DailyQuestView()
     }
 }
