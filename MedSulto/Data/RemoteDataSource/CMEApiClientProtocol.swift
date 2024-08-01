//
//  CMEApiClientProtocol.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation
import Combine

protocol CMEAPIClientProtocol: APIClientTypeProtocol {
    func fetchAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError>
    func searchForCoursesBy(name: String) -> AnyPublisher<CMELandingResponse, NetworkError>
    func fetchAllUserCertificates() -> AnyPublisher<CertificateResponse, NetworkError>
}
