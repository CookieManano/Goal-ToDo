import Foundation
import SwiftData
import SwiftUI

struct IdeaList: View {
    @Query(sort: \Idea.date) private var ideas: [Idea]
    @Environment(\.modelContext) private var context
    @State var newIdea: Idea?

    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(alignment: .leading) {
                    ForEach(ideas) { idea in
                        IdeaCard(idea: idea)
                            .padding(.bottom)
                            .padding(.horizontal,15)
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add", systemImage: "plus",action: addIdea)
                }
            }
            .sheet(item: $newIdea){idea in
                IdeaSheet(idea: idea)
                    .interactiveDismissDisabled()
            }
            .navigationTitle("iDea")
        }
    }
    
    private func addIdea(){
        let newIdea = Idea(ideaName: "", content: "", date: .now, color: "")
        context.insert(newIdea)
        self.newIdea = newIdea
    }
    
    private func deleteIdea(indexes: IndexSet){
        for index in indexes{
            context.delete(ideas[index])
        }
    }
    
}

#Preview {
    IdeaList()
        .modelContainer(SampleData.shared.modelContainer)
}
