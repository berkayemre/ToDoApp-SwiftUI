//
//  ListItemViewVM.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class ListItemViewVM : ObservableObject {
    init() {}
    func toggleIsDone(item: ListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
            db.collection("users")
              .document(uid)
              .collection("todos")
              .document(itemCopy.id)
              .setData(itemCopy.asDictionary())
    }
}
