//
//  CMEsRepositoryProtocol.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
protocol CMEsRepositoryProtocol {
    func getAllCourses() async -> Result<CMELandingResponse, NetworkError>
    func getSearchResult(name: String) async -> Result<CMELandingResponse, NetworkError>
    func getAllUserCertificates() async -> Result<CertificateResponse, NetworkError>
}

