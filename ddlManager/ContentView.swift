import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View{
        TabView{
            Tab("iDea",systemImage: "lasso.badge.sparkles"){
                IdeaList()
            }
            Tab("ToDo",systemImage:"long.text.page.and.pencil"){
                
            }
            Tab("User",systemImage:"person"){
                
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
