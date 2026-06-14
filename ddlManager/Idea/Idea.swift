import Foundation
import SwiftData

@Model
class Idea {
    var ideaName: String
    var content: String
    var date: Date
    var color: String
    var toDo = [Todo]()

    init(ideaName: String, content: String, date: Date, color: String = "Short-Term") {
        self.ideaName = ideaName
        self.content = content
        self.date = date
        self.color = color
    }

    static let sampleData = [
        Idea(ideaName: "Code", content: "Use swift to design an app", date: .now, color: "Short-Term"),
        Idea(ideaName: "Learn", content: "Learn latin with duolingo", date: .now, color: "Mid-Term"),
    ]
}
