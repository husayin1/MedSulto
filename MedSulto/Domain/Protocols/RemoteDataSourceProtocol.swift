//
//  APIClientType.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine

protocol APIClientType {
    func getAllCourses()-> AnyPublisher<CMELandingResponse, NetworkError>
}

typealias RemoteDataSource = APIClientType
