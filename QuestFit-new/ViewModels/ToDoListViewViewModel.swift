//
//  ToDoListViewViewModel.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
//

import SwiftUI
import Foundation
import FirebaseFirestore
/// ViewModel for list of items view
/// Primary tab

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("Reminders")
            .document(id)
            .delete { error in
                if let error = error {
                    print("Error removing document: \(error)")
                } else {
                    print("Document successfully removed!")
                }
            }
    }

}
