//
//  APIClient.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Alamofire
import Combine
class APIClient: RemoteDataSource {
    private func performRequest<T: Decodable>(route: APIRoute) -> AnyPublisher<T, NetworkError> {
            let urlRequest: URLRequest
            do {
                urlRequest = try route.asURLRequest()
            } catch {
                return Fail(error: .other(error.localizedDescription)).eraseToAnyPublisher()
            }

            // Log request details
            if let requestBody = try? JSONSerialization.data(withJSONObject: route.parameters ?? [:], options: .prettyPrinted),
               let requestBodyString = String(data: requestBody, encoding: .utf8) {
                print("Request Body:")
                print(requestBodyString)
            }
            print("URL: \(urlRequest.url?.absoluteString ?? "Invalid URL")")

            return AF.request(urlRequest)
                .validate()
                .publishDecodable(type: T.self)
                .mapError { error in
                    return NetworkError.serverError(error.localizedDescription)
                }
                .flatMap { response in
                    switch response.result {
                    case .success(let model):
                        return Just(model).setFailureType(to: NetworkError.self).eraseToAnyPublisher()
                    case .failure(let error):
                        return Fail(error: .serverError(error.localizedDescription)).eraseToAnyPublisher()
                    }
                }
                .eraseToAnyPublisher()
        }
    
    func getAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError> {
            return performRequest(route: APIRoute.getCMELandingPage())
        }

    
}
