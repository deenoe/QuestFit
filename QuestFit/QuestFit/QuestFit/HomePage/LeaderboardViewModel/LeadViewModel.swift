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

@MainActor
class LeaderboardViewModel: ObservableObject {
    var authViewModel: AuthViewModel  // Use a regular property instead of @EnvironmentObject
    @Published var leaderboardEntries: [LeaderboardEntry] = []

    init(authViewModel: AuthViewModel) {
        self.authViewModel = authViewModel

        // Fetch the leaderboard upon initialization
        Task {
            do {
                let fetchedLeaderboard = try await authViewModel.fetchLeaderboard()
                self.leaderboardEntries = fetchedLeaderboard
            } catch {
                // Handle error, e.g., show an alert or log the error
                print("Error fetching leaderboard: \(error)")
            }
        }
    }
}
