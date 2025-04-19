
import SwiftUI

class ChatViewModel: ObservableObject {

    @Published var query: String = ""
    @Published var queries: [String] = []
    @Published var isLoading: Bool = false
    @Published var LLM: String
    private var llmModel = LLMService(apiKey: "boof api key")
        
    enum ChatError: Error {
        case invalidInput
    }
    
    init (LLM: String) {
        self.LLM = LLM
    }
    
    func getChatResponse() async throws {
        
        guard !query.isEmpty else {
            throw ChatError.invalidInput
        }
        
        isLoading = true
        
        if(LLM == "gem") {
            let request = GemModelRequest(content: query)
            
            do {
                let response: GemModelResponse = try await (llmModel.receiveGemResponse(body: request))
                
                await MainActor.run {
                    let reply = response.response ?? "Failed Response"
                    queries.append(reply)
                    query = ""
                    isLoading = false
                }
            } catch {
                print("Error fetching response: \(error)")
            }
        }
        
        
        
    }
    
}
