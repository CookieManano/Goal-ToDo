import SwiftUI

struct IdeaCard: View {
    let idea: Idea
    
    private var ideaColor: Color {
        switch idea.color {
        case "red":    return .red
        case "yellow": return .yellow
        case "blue":   return .blue
        default:       return .primary
        }
    }
    
    var body: some View {
        NavigationLink(destination: IdeaDetail(idea: idea)){
                VStack(alignment: .leading, spacing: 4) {
                    Text(idea.ideaName)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(ideaColor)
                    Text(idea.content)
                        .font(.title3)
                    HStack{
                        
                        Text(idea.date, style: .date)
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
        }.buttonStyle(.plain)
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
        )
    }
}

#Preview {
    IdeaCard(idea: Idea(ideaName: "Code", content: "Use Swift to create", date: .now, color: "red"))
}
