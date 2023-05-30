//
//  OpenAIService.swift
//  imageGeneratorApp
//
//  Created by ryananda on 29/05/23.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endPointUrl = "https://api.openai.com/v1/images/generations"
    
    func generateImage(prompt: String) async throws -> OpenAIImageResponse {
        let body = OpenAIImageRequestBody(prompt: prompt, size: "512x512")
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAIAPIKey)"]
        
        return try await AF.request(endPointUrl, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIImageResponse.self).value
    }
}

struct OpenAIImageResponse: Decodable {
    let data: [OpenAIImageURL]
}

struct OpenAIImageURL: Decodable {
    let url: String
}

struct OpenAIImageRequestBody: Encodable {
    let prompt: String
    let size: String
}


