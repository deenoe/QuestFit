//
//  Workout.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
//
import Foundation

struct Workouts: Identifiable, Encodable, Decodable {
    var id = UUID()
    var exerciseName: String
    var setCount: Int
    var repCount: Int
    var exp: Int
}
