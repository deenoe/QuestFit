//
//  DailyQuestViewViewModel.swift
//  QuestFit-new
//
//  Created by Miguel Bunag on 5/4/24.
//

import Foundation
import FirebaseFirestore


class DailyQuestViewViewModel: ObservableObject {
    
    @Published var quests = [Workouts]()
    
    private var db = Firestore.firestore()
    
    private var currentCollection = "chest"
    
    func fetchQuests() {
        print("Accessing \(currentCollection)")
        
        // Check if quests are saved locally and last fetched within 24 hours
        if let savedQuests = loadQuestsFromStorage(),
           let lastFetchedDate = UserDefaults.standard.object(forKey: "LastFetchedDate") as? Date,
           Date().timeIntervalSince(lastFetchedDate) < 24 * 60 * 60 {
            // Use saved quests from local storage
            self.quests = savedQuests
            print("Loaded quests from local storage")
            return
        }
        
        // Fetch quests from Firestore
        db.collection(currentCollection).getDocuments { [weak self] (querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents returned")
                return
            }
            
            var allQuests = documents.compactMap { queryDocumentSnapshot -> Workouts? in
                let data = queryDocumentSnapshot.data()
                guard let exerciseName = data["exerciseName"] as? String,
                      let setCount = data["setCount"] as? Int,
                      let repCount = data["repCount"] as? Int,
                      let exp = data["exp"] as? Int else {
                    return nil
                }
                
                return Workouts(id: UUID(uuidString: queryDocumentSnapshot.documentID) ?? UUID(),
                                exerciseName: exerciseName,
                                setCount: setCount,
                                repCount: repCount,
                                exp: exp)
            }
            
            // Shuffle all quests
            allQuests.shuffle()
            
            // Take only the first 5 quests
            let selectedQuests = Array(allQuests.prefix(7))
            
            // Save fetched quests to local storage
            self?.saveQuestsToStorage(selectedQuests)
            
            // Update last fetched date
            UserDefaults.standard.set(Date(), forKey: "LastFetchedDate")
            
            self?.quests = selectedQuests
            print("Fetched quests from Firestore and saved to local storage")
        }
    }
    
    private func saveQuestsToStorage(_ quests: [Workouts]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(quests)
            UserDefaults.standard.set(data, forKey: "SavedQuests")
        } catch {
            print("Error encoding quests: \(error.localizedDescription)")
        }
    }
    
    private func loadQuestsFromStorage() -> [Workouts]? {
        guard let data = UserDefaults.standard.data(forKey: "SavedQuests") else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let quests = try decoder.decode([Workouts].self, from: data)
            return quests
        } catch {
            print("Error decoding quests: \(error.localizedDescription)")
            return nil
        }
    }
}
