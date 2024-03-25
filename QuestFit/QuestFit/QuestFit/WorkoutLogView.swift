//
//  WorkoutLogView.swift
//  QuestFit
//
//  Created by Max Lopez on 2/22/24.
//

import SwiftUI

struct WorkoutLogView: View {
    @State private var isLoggingWorkout = false
    @State private var loggedWorkouts = ListOfWorkouts( date: Date())

    var body: some View {
        NavigationView {
            VStack {
                if isLoggingWorkout {
                    // View for logging a new workout
                    AddLog(loggedWorkouts: $loggedWorkouts)
                } else {
                    // View for displaying all workouts
                    //AllWorkoutsView(allWorkouts: allWorkouts)
                    Text("Will Display all workouts")
                }
            }
            .navigationBarTitle("Workout Log")
            .navigationBarItems(trailing: Button(action: {
                // Action to start logging a new workout
                createNewLoggedWorkout()
            }) {
                Text("Start New Workout")
            })
        }
    }
    
    
    private func createNewLoggedWorkout() {
        // Create a new LoggedWorkout and append it to the list
        let newLoggedWorkout = ListOfWorkouts(date: Date()) // You can customize the initializer as needed
       // loggedWorkouts.workouts.append(newLoggedWorkout)
        
        // Set isLoggingWorkout to true to show the logging view
        isLoggingWorkout = true
    }

}

struct WorkoutLogView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutLogView()
    }
}

