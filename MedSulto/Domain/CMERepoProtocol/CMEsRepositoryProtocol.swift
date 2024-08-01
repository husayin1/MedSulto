//
//  CMEsRepositoryProtocol.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
protocol CMEsRepositoryProtocol {
    func getAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError>
    func getSearchResult(name: String) -> AnyPublisher<CMELandingResponse, NetworkError>
    func getAllUserCertificates() -> AnyPublisher<CertificateResponse, NetworkError>
}

