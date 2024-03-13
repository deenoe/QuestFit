//
//  AuthViewModel.swift
//  QuestFit
//
//  Created by Miguel Bunag on 3/1/24.
//
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import Combine

protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch{
            
                print("DEBUG: Failed to sign in user with \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, username: username, email: email, level: 0)
            self.currentUser = user
            let encodedUser = try Firestore.Encoder().encode(self.currentUser)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch{
            print("DEBUG: Failed to create user with error. \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current User is \(String(describing: self.currentUser))")
    }
    
    func fetchLeaderboard() async throws -> [LeaderboardEntry] {
        var leaderboardEntries: [LeaderboardEntry] = []

        do {
            let snapshot = try await Firestore.firestore()
                .collection("users")
                .order(by: "level", descending: true)
                .limit(to: 50)
                .getDocuments()

            for document in snapshot.documents {
                guard let username = document["username"] as? String,
                      let level = document["level"] as? Int else {
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
}

