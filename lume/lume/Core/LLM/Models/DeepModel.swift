struct DeepModelResponse: Decodable {
    var success: Bool
    var response: String
    var error: String
}

struct DeepModelRequest: Encodable {
    var content: String
}


