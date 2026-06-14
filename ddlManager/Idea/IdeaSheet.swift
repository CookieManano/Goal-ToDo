import Foundation
import SwiftUI
import SwiftData

struct IdeaSheet: View {
    @Bindable var idea: Idea
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State var newTodo: Todo?

    var body: some View {
        NavigationStack {
            Form {
                TextField("What's your idea", text: $idea.ideaName)
                
                ZStack(alignment: .topLeading) {
                    if idea.content.isEmpty {
                        Text("What's the Detail")
                            .foregroundStyle(.secondary)
                            .padding(.leading, 4)
                            .padding(.top, 8)
                            .allowsHitTesting(false)
                    }
                    TextEditor(text: $idea.content)
                        .frame(minHeight: 100)
                        .padding(.leading, -4)
                }
                
                Section {
                    Picker("Achieve in",selection: $idea.color) {
                        Label {
                            Text("Short-Term")
                        } icon: {
                            Image(systemName: "circle.fill")
                                .tint(.red)
                        }
                        .tag("red")
                        
                        Label {
                            Text("Mid-Term")
                        } icon: {
                            Image(systemName: "circle.fill")
                                .tint(.yellow)
                        }
                        .tag("yellow")
                        
                        Label {
                            Text("Long-Term")
                        } icon: {
                            Image(systemName: "circle.fill")
                                .tint(.blue)
                        }
                        .tag("blue")
                    }
                }
                Section{
                    ForEach(idea.toDo){todo in
                        Text(todo.title)
                    }
                }
                Button {
                    addTodo()
                } label: {
                    HStack{
                        Spacer()
                        Image(systemName:"plus")
                        Text(idea.toDo.isEmpty ? "Add ToDo to start" : "Add ToDo")
                            .padding(.top,1)
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .padding(.top,-40)
            }
            .navigationTitle("New Idea")
            .navigationBarTitleDisplayMode(.inline)
            .listRowInsets(EdgeInsets())
            .sheet(item: $newTodo){todo in
                TodoSheet(todo: todo)
                    .interactiveDismissDisabled()
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "checkmark.circle") {
                        if idea.ideaName.isEmpty{
                            context.delete(idea)
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark.circle") {
                        context.delete(idea)
                        dismiss()
                    }
                    .tint(.red)
                }
            }
        }
    }
    
    internal func addTodo(){
        let newTodo = Todo( title: "", note: "", endDate: .now, startDate: .now, place: "")
        context.insert(newTodo)
        self.newTodo = newTodo
    }
    
}
#Preview {
    IdeaSheet(idea: SampleData.shared.idea)
}
