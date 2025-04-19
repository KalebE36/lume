import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    

    var body: some View {
        VStack {
            HStack {
                Menu {
                    Button("GPT", action: {
                        
                    })
                    Button("Claude", action: {
                        
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



            TextField("Type your message...", text: $viewModel.query)
                .padding()
                .foregroundColor(.white)
                .background(Color.clear)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 1)
                )
            Button(action: {
                Task {
                    try? await viewModel.getChatResponse()
                }
            }) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding()
            }
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
