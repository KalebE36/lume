struct DeepModelResponse: Decodable {
    var success: Bool
    var response: String
    var error: String
}

struct DeepModelRequest: Encodable {
    var content: String
}

enum DeepError: Error {
    case serverError
    case invalidURL
    case invalidResponse
    case invalidData
}



