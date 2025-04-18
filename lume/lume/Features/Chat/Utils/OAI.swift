
import Foundation

class OAI {
    private let apiKey: String
    private let baseStringURL: String
    
    init(apiKey: String, baseStringURL: String) {
        self.apiKey = apiKey
        self.baseStringURL = baseStringURL
    }
    
    func recieveResponse() async throws -> OAIModelResponse {
        
    }
    
    
}
