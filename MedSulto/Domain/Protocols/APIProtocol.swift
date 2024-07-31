//
//  APIProtocol.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation

protocol API {
    static var baseUrl: String { get }
    static var bearerToken: String { get }
}
