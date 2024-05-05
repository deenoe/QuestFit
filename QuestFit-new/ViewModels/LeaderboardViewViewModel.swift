//
//  LeadViewModel.swift
//  QuestFit
//
//  Created by Miguel Bunag on 3/8/24.
//

import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import Combine
import Foundation

class LeaderboardViewModel: ObservableObject{
    @Published var users = [LeaderboardEntry]()
    
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("users")
            .order(by: "userLevel", descending: true) // Sort by userLevel from higehst to lowest
            .limit(to: 10) // Limit to top 10 users
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.users = documents.compactMap { (queryDocumentSnapshot) -> LeaderboardEntry? in
                    let data = queryDocumentSnapshot.data()

                    guard let username = data["name"] as? String,
                          let userLevel = data["userLevel"] as? Int else {
                        return nil // Skip this entry if data is not valid
                    }

                    return LeaderboardEntry(username: username, level: userLevel)
                }
            }
    }

}
