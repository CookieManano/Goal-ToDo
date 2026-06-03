import Foundation
import SwiftData

@Model
class Todo{
    var title: String
    var note: String
    var endDate: Date
    var startDate: Date
    var place: String
    var ideaName:String
    var isFinish: Bool
    
    init(title: String, note: String, endDate: Date, startDate: Date, place: String, ideaName: String) {
        self.title = title
        self.note = note
        self.endDate = endDate
        self.startDate = startDate
        self.place = place
        self.isFinish = false
        self.ideaName = ideaName
    }
    
    static let sampleData = [
        Todo(title: "Learn Swift", note: "after class", endDate: .now, startDate: .now, place: "BISTU", ideaName: "Code"),
        Todo(title: "Learn Swift", note: "after class", endDate: .now, startDate: .now, place: "BISTU", ideaName: "Code"),
        Todo(title: "Learn Swift", note: "after class", endDate: .now, startDate: .now, place: "BISTU", ideaName: "Code"),
    ]
}
