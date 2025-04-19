import SwiftUI

struct ChatView: View {
    @State var selectedLLM: String = "gem"
    
    

    var body: some View {
        @StateObject var viewModel = ChatViewModel(LLM: selectedLLM)
        
        VStack {
            HStack {
                Menu {
                    Button("GPT", action: {
                        
                    })
                    Button("Claude", action: {
                        selectedLLM = "clde"
                    })
                } label: {
                    Label("LLM", systemImage: "list.bullet")
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()
                Button(action: {
                    print("hi")}
                ) {
                    Image(systemName: "gear")
                }.font(.title2)
                
            }
            .padding(.horizontal)
            .padding(.top)

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.queries, id: \.self) { message in Text(message)
                          .padding(8)
                          .background(Color.blue)
                          .foregroundColor(.white)
                          .cornerRadius(10)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 1)
            )



            TextField("Type your message...", text: $viewModel.query, onCommit: {
                Task {
                    try? await viewModel.getChatResponse()
                }
            })
                .padding()
                .foregroundColor(.white)
                .background(Color.clear)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.bottom)

        }
        .background(Color.gray)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ChatView()
}
