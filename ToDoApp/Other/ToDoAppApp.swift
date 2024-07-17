//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import SwiftUI
import Firebase


@main
struct ToDoAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
