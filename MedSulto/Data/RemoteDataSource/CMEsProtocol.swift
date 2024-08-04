//
//  CMEsAPIProtocol.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation

protocol CMEsAPIProtocol: APIClientTypeProtocol {
//    func fetchAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError>
//    func searchForCoursesBy(name: String) -> AnyPublisher<CMELandingResponse, NetworkError>
//    func fetchAllUserCertificates() -> AnyPublisher<CertificateResponse, NetworkError>
    func fetchAllCourses() async throws -> Result<CMELandingResponse, NetworkError>
    func searchForCoursesBy(name: String) async throws -> Result<CMELandingResponse, NetworkError>
    func fetchAllUserCertificates() async throws -> Result<CertificateResponse, NetworkError>
}
