import SwiftUI

struct TaskListView: View {
    @State private var tasks: [Task] = []
    private var categories: [String]

    init(categories: [String]) {
        self.categories = categories
    }

    var body: some View {
        VStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.name)
                        Spacer()
                        Button(action: { deleteTask(task) }) {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Tasks")
            .navigationBarItems(
                trailing:
                Button(action: addTask) {
                    Image(systemName: "plus")
                }
            )
        }
        .onAppear { loadTasks() }
    }

    private func loadTasks() {
        // Load tasks filtered by category
        // This function will load tasks based on the selected category
    }

    private func addTask() {
        // Code to add a new task
        // Use a prompt or a new view to get task details
    }

    private func deleteTask(_ task: Task) {
        // Code to delete a specific task
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }

    private func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct Task: Identifiable {
    let id: UUID
    var name: String
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(categories: ["Work", "Personal", "Urgent"])
    }
}