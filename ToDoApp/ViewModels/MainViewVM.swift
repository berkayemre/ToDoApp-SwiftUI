//
//  MainViewVM.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import Foundation
import FirebaseAuth

class MainViewVM : ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
            
    }
}
