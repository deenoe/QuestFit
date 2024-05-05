//
//  ProfileViewViewModel.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject{
    @Published var user : User? = nil
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    
    // func levelUp
    // update a value with a document, given a user ID
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            DispatchQueue.main.async{
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0,
                    userLevel: data["userLevel"] as? Int ?? 12)//I think since it is not set in Firebase, it defaults to the optional value of 12
            }
        }
    }
    func logOut(){
        do{
            try Auth.auth().signOut()
        } catch{
            print(error)
        }
    }
    
    func fetchLeaderboard() async throws -> [LeaderboardEntry] {
        var leaderboardEntries: [LeaderboardEntry] = []

        do {
            let snapshot = try await Firestore.firestore()
                .collection("users")
                .order(by: "user level", descending: true)
                .limit(to: 50)
                .getDocuments()

            for document in snapshot.documents {
                guard let username = document["username"] as? String,
                      let level = document["user level"] as? Int else {
                    continue // Skip this entry if data is not valid
                }

                let leaderboardEntry = LeaderboardEntry(username: username, level: level)
                leaderboardEntries.append(leaderboardEntry)
            }

        } catch {
            throw error
        }

        return leaderboardEntries
    }
    
    func updateUserLevel(newLevel: Int) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).updateData(["userLevel": newLevel]) { error in
            if let error = error {
                print("Error updating user level: \(error.localizedDescription)")
            } else {
                print("User level updated successfully!")
            }
        }
    }

}


