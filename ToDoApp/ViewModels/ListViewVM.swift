//
//  ListViewVM.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import Foundation
import FirebaseFirestore

class ListViewVM : ObservableObject {
    
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId:String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
        
    }
}
