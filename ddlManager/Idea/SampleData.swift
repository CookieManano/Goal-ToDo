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
    
    private init() {
        let schema = Schema([
            Idea.self
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
            
    }
}
