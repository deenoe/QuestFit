//
//  ToDoListItemsViewViewModel.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for single to do list item view (each row in items list)
class ToDoListItemsViewViewModel: ObservableObject{
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
            itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("Reminders")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}

