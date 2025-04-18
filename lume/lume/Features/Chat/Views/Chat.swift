import SwiftUI

struct ChatView: View {
    @State private var messageText: String = "" // State for the input field
    @State private var messages: [String] = ["test 1"]

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

            }
            .padding(.horizontal)
            .padding(.top)

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages, id: \.self) { message in
                        Text(message)
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


            // --- Input TextField ---
            TextField("Type your message...", text: $messageText)
                .padding()
                .foregroundColor(.white)
                .background(Color.clear)
                .cornerRadius(20) // Rounded corners for the TextField view
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
