//
//  RepositoryProtocol.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
protocol RepositoryProtocol {
    func getAllCourses()-> AnyPublisher<CMELandingResponse, NetworkError>

}

