
    import Foundation

    class LLMService {
        
        // Vars
        private let apiKey: String
        
        // Functions
        init(apiKey: String) {
            self.apiKey = apiKey
        }
        
        func receiveGemResponse(body: GemModelRequest) async throws -> GemModelResponse {
            
            
            /* ModelEndpoints defined in the APIConfig within config dir in / */
            guard let url = ModelEndpoints.gem.url() else {
                throw GemError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            /* Need to encode the body from the data class */
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
            
            guard let url = ModelEndpoints.deep.url() else {
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
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(DeepModelResponse.self, from: data)
            } catch {
                throw DeepError.invalidData
            }
            
        }
        
        
    }
