import SwiftUI

struct CategoryListView: View {
    @State private var categories: [String] = []
    @State private var newCategoryName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                    .onDelete(perform: deleteCategory)
                }
                
                HStack {
                    TextField("New Category", text: &$newCategoryName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: addCategory) {
                        Text("Add")
                    }
                }
                .padding()
            }
            .navigationBarTitle("Categories")
        }
    }

    private func addCategory() {
        if !newCategoryName.isEmpty {
            categories.append(newCategoryName)
            newCategoryName = ""
        }
    }

    private func deleteCategory(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}