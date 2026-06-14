import SwiftUI
import SwiftData

struct IdeaDetail: View {
    @Bindable var idea: Idea
    @Environment(\.dismiss) private var dismiss
    @State private var isEditing = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack {
                    if isEditing {
                        TextEditor(text: $idea.content)
                            .font(.title3)
                            .scrollContentBackground(.hidden)
                            //.padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.1))
                            )
                            .frame(height: 100)
                    } else {
                        Text(idea.content)
                            .font(.title3)
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onTapGesture {
                                isEditing = true
                            }
                    }
                }
                //
                
                
                Text("To‑Do")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .padding(.top, 10)
                
                if idea.toDo.isEmpty {
                    Text("No tasks yet")
                        .font(.subheadline)
                        .foregroundStyle(.tertiary)
                } else {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach($idea.toDo) { $todo in
                            HStack(spacing: 8) {
                                Image(systemName: todo.isFinish ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(todo.isFinish ? .green : .secondary)
                                    .onTapGesture {
                                        $todo.isFinish.wrappedValue.toggle()
                                    }
                                Text(todo.title)
                                    .font(.body)
                                    .strikethrough(todo.isFinish)
                                    .foregroundStyle(todo.isFinish ? .secondary : .primary)
                                Spacer()
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.05))
                            )
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle(idea.ideaName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Done" : "Edit") {
                        isEditing.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    IdeaDetail(idea: SampleData.shared.idea)
}
