
    import Foundation

    class LLMService {
        private let apiKey: String
        private let baseStringURL: String = ""
        
        
        
        
        init(apiKey: String) {
            self.apiKey = apiKey
        }
        
        func receiveGemResponse(body: GemModelRequest) async throws -> GemModelResponse {
            
            guard let url = URL(string: baseStringURL) else {
                throw GemError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Need to encode the body from the data class
            request.httpBody = try JSONEncoder().encode(body)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw GemError.invalidResponse
            }
            
            
            
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(GemModelResponse.self, from: data)
            } catch {
                throw GemError.invalidData
            }
            
        }
        
        func recieveDeepResponse(body: DeepModelRequest) async throws -> DeepModelResponse {
            
            guard let url = URL(string: baseStringURL) else {
                throw DeepError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = try JSONEncoder().encode(body)
            
            let(data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw DeepError.invalidResponse
            }
            
        }
        
        
    }
