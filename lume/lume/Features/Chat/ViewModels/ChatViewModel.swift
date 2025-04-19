
import SwiftUI

class ChatViewModel: ObservableObject {

    @Published var query: String = ""
    @Published var queries: [String] = []
    @Published var isLoading: Bool = false
    @Published var LLM: String = "gem"
    
    private let gemModel = Gem(apiKey: "boof for now", baseStringURL: "http://127.0.0.1:5000/query/gem")
    
    enum ChatError: Error {
        case invalidInput
    }
    
    init () {
    }
    
    func getChatResponse() async throws {
        
        guard !query.isEmpty else {
            throw ChatError.invalidInput
        }
        
        isLoading = true
        
        let request = GemModelRequest(content: query)
        
        do {
            let response: GemModelResponse = try await (gemModel.recieveResponse(body: request))
            
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
