//
//  Workout.swift
//  QuestFit
//
//  Created by Max Lopez on 3/21/24.
//

import Foundation

struct Exercise {
    let name: String
    var weight: Double
    var reps: Int
    var sets: Int
    var note: String?

    init(name: String, weight: Double = 0.0, reps: Int = 0, sets: Int = 0, note: String? = nil) {
        self.name = name
        self.weight = weight
        self.reps = reps
        self.sets = sets
        self.note = note
    }
}

struct ListOfWorkouts {
    var workouts: [Exercise]
    var date: Date

    init(exercises: [Exercise] = [], date: Date) {
        self.workouts = exercises
        self.date = date
    }
}

// Example usage:
//let bicepCurls = Exercise(name: "Bicep Curls", weight: 30.0, reps: 10, sets: 3, note: "Feeling the burn!")
//let benchPress = Exercise(name: "Bench Press", weight: 135.0, reps: 8, sets: 4, note: nil)
//
//// You can store these exercises in an array or any other collection as needed
//var workoutExercises: [Exercise] = [bicepCurls, benchPress]
//
//// Create a ListOfWorkouts instance with the workout exercises
//let listOfWorkouts = ListOfWorkouts(exercises: workoutExercises, date: Date())
