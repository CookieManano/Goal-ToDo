import Foundation
import SwiftData
import SwiftUI

struct TodoList: View {
    @Query(sort: \Todo.ideaName) private var todos: [Todo]
    
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
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    Menu{
                        Button{
                            
                        }label: {
                            Label("Index",systemImage: "line.horizontal.3.decrease.circle")
                                .font(.title3)        // 调整字体大小
                                .padding(.vertical, 6)
                        }
                    }label: {
                        Image(systemName: "line.horizontal.3")
                    }
                }
            }
        }
    }
}

#Preview {
    TodoList()
        .modelContainer(SampleData.shared.modelContainer)
}
