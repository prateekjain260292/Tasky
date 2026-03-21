import SwiftUI

struct AddTaskView: View {
    @State private var taskName: String = ""
    @State private var selectedCategory: String = "Work"
    @State private var dueDate: Date = Date()

    let categories = ["Work", "Personal", "Shopping", "Others"]

    var body: some View {
        Form {
            Section(header: Text("New Task")) {
                TextField("Task Name", text: $taskName)
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \”self\”) { category in
                        Text(category).tag(category)
                    }
                }
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            Button(action: { 
                // Action to save the new task
            }) {
                Text("Add Task")
            }
        }
        .navigationTitle("Add New Task")
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}