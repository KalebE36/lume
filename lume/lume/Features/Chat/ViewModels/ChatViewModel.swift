
import SwiftUI

class ChatViewModel: ObservableObject {

    @Published var query: String = ""
    @Published var queries: [String] = []
    @Published var isLoading: Bool = false
    @Published var LLM: String = "gem"
    
    private let gemModel = Gem(apiKey: "boof for now", baseStringURL: "127.0.0.1:5000")
    private var request: GemModelRequest
    
    enum ChatError: Error {
        case invalidInput
    }
    
    init () {}
    
    func getChatResponse() async throws {
        
        guard !query.isEmpty else {
            throw ChatError.invalidInput
        }
        
        isLoading = true
        
        request.content = query
        
        do {
            let response: GemModelResponse = try await (gemModel.recieveResponse(body: request))
            
            await MainActor.run {
                let reply = response.response ?? "Failed Response"
                queries.append(reply)
                isLoading = false
            }
        } catch {
            print("Error fetching response: \(error)")
        }
        
        isLoading = false
        
    }
    
}
