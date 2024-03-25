//
//  LogWorkoutView.swift
//  QuestFit
//
//  Created by Max Lopez on 3/21/24.
//

import SwiftUI

struct LogWorkoutView: View {
    
    @Binding var selectedCategory: String
        @Binding var selectedWorkout: String
        @Binding var reps: Int
        @Binding var sets: Int
        @Binding var notes: String
        @Binding var isLoggingWorkout: Bool
    
    var body: some View {
        Text("LogWorkout View")
    }
}

struct LogWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutLogView()
    }
}

