//
//  User.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    let userLevel: Int
}
