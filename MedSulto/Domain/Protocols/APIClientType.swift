//
//  APIClientType.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
protocol APIClientType {
    func performRequest<T: Decodable>(route: APIRoute) -> AnyPublisher<T, NetworkError>
}
