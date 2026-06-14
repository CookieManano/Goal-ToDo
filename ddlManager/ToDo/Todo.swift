import Foundation
import SwiftData

@Model
class Todo{
    var title: String
    var note: String
    var endDate: Date
    var startDate: Date
    var place: String
    var isFinish: Bool
    var forIdea: Idea?
    
    init(title: String, note: String, endDate: Date, startDate: Date, place: String) {
        self.title = title
        self.note = note
        self.endDate = endDate
        self.startDate = startDate
        self.place = place
        self.isFinish = false
    }
    
    static let sampleData = [
        Todo(title: "Learn Swift", note: "after class", endDate: .now, startDate: .now, place: "BISTU"),
        Todo(title: "Learn Swift", note: "after class", endDate: .now, startDate: .now, place: "BISTU"),
        Todo(title: "Learn Swift", note: "after class", endDate: .now, startDate: .now, place: "BISTU"),
    ]
}
