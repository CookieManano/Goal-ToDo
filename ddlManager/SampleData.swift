import Foundation
import SwiftData

@MainActor
class SampleData{
    let modelContainer: ModelContainer
    static let shared = SampleData()
    var context: ModelContext{
        modelContainer.mainContext
    }
    
    var idea: Idea{
        Idea.sampleData.first!
    }
    var todo: Todo{
        Todo.sampleData.first!
    }
    
    private init() {
        let schema = Schema([
            Idea.self,
            Todo.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema,isStoredInMemoryOnly: true)
        do{
            modelContainer  = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        }catch{
            fatalError("Could not create ModelContainer:\(error)")
        }
    }
    
    
    private func insertSampleData(){
        for idea in Idea.sampleData{
            context.insert(idea)
        }
        
        for todo in Todo.sampleData{
            context.insert(todo)
        }
        
        Idea.sampleData[0].toDo = [Todo.sampleData[1]]
        Idea.sampleData[1].toDo = [Todo.sampleData[0]]
            
    }
}
