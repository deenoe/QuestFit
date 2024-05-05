//
//  Workout.swift
//  QuestFit-new
//
//  Created by Miguel Bunag on 5/4/24.
//
import Foundation

struct Workouts: Identifiable, Encodable, Decodable {
    var id = UUID()
    var exerciseName: String
    var setCount: Int
    var repCount: Int
    var exp: Int
}
