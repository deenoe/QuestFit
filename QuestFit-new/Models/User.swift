//
//  User.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    let userLevel: Int
}
