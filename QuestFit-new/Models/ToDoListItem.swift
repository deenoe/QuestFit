//
//  ToDoListItem.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id : String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
