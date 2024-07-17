//
//  User.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import Foundation

struct User : Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
