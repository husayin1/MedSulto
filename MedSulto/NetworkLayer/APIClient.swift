//
//  APIClient.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Alamofire

class APIClient: APIClientTypeProtocol {
    //maybe make singleton
    func performRequest<T: Decodable>(route: CMEAPIRoute) async  -> Result<T, NetworkError> {
        let urlRequest: URLRequest
        do {
            urlRequest = try route.asURLRequest()
        } catch {
            return .failure(NetworkError.other(error.localizedDescription))
        }
        
        // Log request details
        if let requestBody = try? JSONSerialization.data(withJSONObject: route.parameters ?? [:], options: .prettyPrinted),
           let requestBodyString = String(data: requestBody, encoding: .utf8) {
            print("Request Body:")
            print(requestBodyString)
        }
        print("URL: \(urlRequest.url?.absoluteString ?? "Invalid URL")")
        // Perform the network request
        let response = await AF.request(urlRequest)
            .validate()
            .serializingDecodable(T.self)
            .response
        
//        print(response.result)
        switch response.result {
        case .success(let model):
            return .success(model)
        case .failure(let error):
            return .failure(NetworkError.serverError(error.localizedDescription))
        }
    }
    
    
}
