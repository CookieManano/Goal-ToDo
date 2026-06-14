import Foundation
import SwiftUI
import SwiftData

struct TodoCard: View {
    let todo: Todo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    todo.isFinish.toggle()
                } label: {
                    Image(systemName: todo.isFinish ? "checkmark.circle" : "circle")
                        .font(.system(size: 20))
                        .foregroundStyle(todo.isFinish ? .green : .secondary)
                        .padding(.trailing,5)
                }
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(todo.isFinish ? .gray : .blue)
                        .strikethrough(todo.isFinish, pattern: .solid)
                    Text(todo.note)
                        .font(.headline)
                }
                Spacer()
                Text(todo.forIdea?.ideaName ?? "")
                    .foregroundStyle(.secondary)
                    .fontWeight(.black)
            }
            Divider()
            HStack {
                Text(todo.place)
                    .foregroundStyle(.secondary)
                Spacer()
                Text("At")
                    .fontWeight(.bold)
                Text(todo.endDate, style: .date)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}

#Preview {
    TodoCard(todo: Todo(title: "回家", note: "坐地铁", endDate: .now, startDate: .now, place: "BISTU"))
}
