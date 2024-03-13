//
//  Leaderboard.swift
//  QuestFit
//
//  Created by Miguel Bunag on 3/8/24.
//

import Foundation

struct LeaderboardEntry: Codable, Identifiable {
    var id = UUID()
    let username: String
    let level: Int

    // Add any additional properties or methods as needed

    init(username: String, level: Int) {
        self.username = username
        self.level = level
    }
}


