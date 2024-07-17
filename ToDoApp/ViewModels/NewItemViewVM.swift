//
//  NewItemViewVM.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewVM : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        ///Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        ///Create Model
        let newId = UUID().uuidString
        let newItem = ListItem(
           id: newId,
           title: title,
           dueDate: Date().timeIntervalSince1970,
           createdDate: Date().timeIntervalSince1970,
           isDone: false)
        
        ///Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave:Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
}
