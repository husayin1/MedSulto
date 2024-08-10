//
//  APIClientType.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine

protocol APIClientTypeProtocol {
    func performRequest<T: Decodable>(route: CMEAPIRoute)  async -> Result<T, NetworkError>
}

