

struct GemModelResponse: Decodable {
    var success: Bool
    var response: String?
    var error: String?
}

struct GemModelRequest: Encodable {
    var content: String
}

enum GemError: Error {
    case serverError
    case invalidURL
    case invalidResponse
    case invalidData
}

