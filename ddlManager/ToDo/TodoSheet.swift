import Foundation
import SwiftData
import SwiftUI

struct TodoSheet: View {
    @Bindable var todo: Todo
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query private var ideas: [Idea]

    var body: some View {
        NavigationStack {
            Form {
                TextField("What to do",text:$todo.title)
                ZStack(alignment: .topLeading) {
                    if todo.note.isEmpty {
                        Text("Note")
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                            .padding(.leading, 4)
                    }
                    TextEditor(text: $todo.note)
                        .frame(minHeight: 100)
                }
                Section{
                    DatePicker("Deadline",selection: $todo.endDate,displayedComponents: .date)
                    TextField("Place",text:$todo.place)
                }
                Section{
                    Picker("Idea",selection:$todo.forIdea){
                        ForEach(ideas){idea in
                            Text(idea.ideaName)
                                .tag(idea)
                        }
                    }
                }
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement:.confirmationAction){
                    Button{
                        if todo.title.isEmpty{
                            context.delete(todo)
                        }
                        dismiss()
                    }label: {
                        Image(systemName:"checkmark.circle.fill")
                            .foregroundStyle(.blue)
                            .font(.system(size: 29))
                    }
                    .frame(width: 10)
                }
                ToolbarItem(placement: .cancellationAction){
                    Button{
                        context.delete(todo)
                        dismiss()
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                            .font(.system(size: 29))
                    }
                    .frame(width: 10)
                }
            }
        }
    }
}

#Preview {
    TodoSheet(todo: Todo.sampleData.first!)
        .modelContainer(SampleData.shared.modelContainer)
}
