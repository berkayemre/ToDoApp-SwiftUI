//
//  ListItem.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import Foundation

struct ListItem: Codable, Identifiable {
    
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}