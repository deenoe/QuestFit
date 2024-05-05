//
//  DailyQuestView.swift
//  QuestFit-new
//
//  Created by Miguel Bunag on 5/4/24.
//
import SwiftUI


struct DailyQuestView: View {
    @ObservedObject var viewModel = DailyQuestViewViewModel()


    var body: some View {
        NavigationView {
            List(viewModel.quests) { workout in
                VStack(alignment: .leading) {
                    Text(workout.exerciseName)
                }
            }
            .navigationTitle("Daily Quests")
        }
        .onAppear() {
            self.viewModel.fetchQuests()
        }
    }
}

/*
 struct DailyQuestView_Previews: PreviewProvider {
 static var previews: some View{
 DailyQuestView()
 }
 }
 */
