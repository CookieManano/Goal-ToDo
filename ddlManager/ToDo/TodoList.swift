import Foundation
import SwiftData
import SwiftUI

struct TodoList: View {
    @Query private var todos: [Todo]
    @Environment(\.modelContext) private var context
    @State var newTodo: Todo?
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    ForEach(todos){ todo in
                        TodoCard(todo: todo)
                    }
                }
            }
            .navigationTitle("ToDo")
            
            .sheet(item: $newTodo){todo in
                TodoSheet(todo: todo)
                    .interactiveDismissDisabled()
            }
            
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    Menu{
                        Button{
                            addTodo()
                        }label: {
                            Label("Index",systemImage: "line.horizontal.3.decrease.circle")
                                .font(.title3)
                                .padding(.vertical, 6)
                        }
                    }label: {
                        Image(systemName: "line.horizontal.3")
                    }
                }
            }
        }
    }
    internal func addTodo(){
        let newTodo = Todo( title: "", note: "", endDate: .now, startDate: .now, place: "")
        context.insert(newTodo)
        self.newTodo = newTodo
    }
    
    private func deleteTodo(indexes: IndexSet){
        for index in indexes{
            context.delete(todos[index])
        }
    }
}

#Preview {
    TodoList()
        .modelContainer(SampleData.shared.modelContainer)
}
