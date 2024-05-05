//
//  Leaderboard.swift
//  QuestFit-new
//
//

import Foundation

struct LeaderboardEntry: Codable, Identifiable {
    var id = UUID()
    let username: String
    let level: Int


    init(username: String, level: Int) {
        self.username = username
        self.level = level
    }
}
