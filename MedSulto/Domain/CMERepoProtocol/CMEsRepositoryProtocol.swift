//
//  CMEsRepositoryProtocol.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
protocol CMEsRepositoryProtocol {
    func getAllCourses() async throws -> Result<CMELandingResponse, NetworkError>
    func getSearchResult(name: String) async throws -> Result<CMELandingResponse, NetworkError>
    func getAllUserCertificates() async throws -> Result<CertificateResponse, NetworkError>
}

