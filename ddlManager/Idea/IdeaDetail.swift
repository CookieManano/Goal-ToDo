import SwiftUI
import SwiftData

struct IdeaDetail: View {
    @Bindable var idea: Idea

    var body: some View {
        NavigationStack {
            VStack {
                Text(idea.content)
                    .font(.title3)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
            )
            .navigationTitle(idea.ideaName)
        }
    }
}

#Preview {
    IdeaDetail(idea: SampleData.shared.idea)
}
