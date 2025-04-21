import Foundation

struct DeepAPI {
    static func Chat(body: DeepModelRequest) async throws -> DeepModelResponse {
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
