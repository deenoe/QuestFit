//
//  Workout.swift
//  QuestFit-new
//
//  Created by Miguel Bunag on 5/4/24.
//

import Foundation
struct Workout: Identifiable, Codable {
    var id: String // Document ID in Firestore
    var exerciseName: String
    var setCount: Int
    var repCount: Int
    var exp: Int
}
