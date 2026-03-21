import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CategoriesView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Categories")
                }

            AllTasksView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("All Tasks")
                }
        }
    }
}

struct CategoriesView: View {
    var body: some View {
        Text("Categories View")
    }
}

struct AllTasksView: View {
    var body: some View {
        Text("All Tasks View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}