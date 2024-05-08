//  QuestManagerViewModel.swift
//  QuestFit-new
//
//  Created by Max Lopez on 5/5/24.
//

import Foundation
class QuestManager {
    static let shared = QuestManager()

    func markQuestAsCompleted(questId: UUID) {
        var completions = getCompletions()
        completions[questId] = Date()
        saveCompletions(completions)
    }

    func isQuestCompletedToday(questId: UUID) -> Bool {
        guard let lastCompleted = getCompletions()[questId] else {
            return false
        }
        return Calendar.current.isDateInToday(lastCompleted)
    }

    private func getCompletions() -> [UUID: Date] {
        guard let data = UserDefaults.standard.data(forKey: "QuestCompletions"),
              let completions = try? JSONDecoder().decode([UUID: Date].self, from: data) else {
            return [:]
        }
        return completions
    }

    private func saveCompletions(_ completions: [UUID: Date]) {
        guard let data = try? JSONEncoder().encode(completions) else {
            return
        }
        UserDefaults.standard.set(data, forKey: "QuestCompletions")
    }
}
