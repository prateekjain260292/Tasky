import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var categories: [String] = []
    @Published var tasks: [String: [String]] = [:] // Category: [Task]

    private let userDefaultsKey = "TaskViewModel"

    init() {
        loadData()
    }

    func addCategory(_ category: String) {
        categories.append(category)
        tasks[category] = []
        saveData()
    }

    func addTask(to category: String, task: String) {
        tasks[category]?.append(task)
        saveData()
    }

    func removeCategory(_ category: String) {
        categories.removeAll { $0 == category }
        tasks[category] = nil
        saveData()
    }

    func removeTask(from category: String, task: String) {
        tasks[category]?.removeAll { $0 == task }
        saveData()
    }

    private func saveData() {
        let data = ["categories": categories, "tasks": tasks]
        UserDefaults.standard.set(data, forKey: userDefaultsKey)
    }

    private func loadData() {
        guard let data = UserDefaults.standard.dictionary(forKey: userDefaultsKey) as? [String: Any],
              let loadedCategories = data["categories"] as? [String],
              let loadedTasks = data["tasks"] as? [String: [String]] else { return }

        categories = loadedCategories
        tasks = loadedTasks
    }
}