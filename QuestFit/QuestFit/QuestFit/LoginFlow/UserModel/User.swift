//
//  User.swift
//  QuestFit
//
//  Created by Miguel Bunag on 3/1/24.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let username: String
    let email: String
    var level: Int
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: username){
            formatter.style = .abbreviated
            return formatter.string(from:components)
        }
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: UUID().uuidString, username: "Miggy Bunag", email: "test@gmail.com", level: 0)
}
