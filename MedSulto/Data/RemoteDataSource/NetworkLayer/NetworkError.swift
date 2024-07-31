//
//  NetworkError.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation

enum NetworkError: Error {
    case networkUnreachable
    case invalidResponse
    case decodingError
    case serverError(String)
    case other(String)
    
    var message: String {
        switch self {
        case .networkUnreachable:
            return "Oops! Something went wrong with the network. Please check your internet connection and try again."
        case .invalidResponse:
            return "Received invalid response from server."
        case .decodingError:
            return "Failed to decode server response."
        case .serverError(let message):
            return message
        case .other(let message):
            return message
        }
    }
}
