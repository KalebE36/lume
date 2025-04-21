
    import Foundation

    class LLMService {

        // Functions
        init() {}
        
        func receiveGemResponse(body: GemModelRequest) async throws -> GemModelResponse {
            return try await GemAPI.Chat(body: body)
        }
        
        func recieveDeepResponse(body: DeepModelRequest) async throws -> DeepModelResponse {
            return try await DeepAPI.Chat(body: body)
        }
        
    }
