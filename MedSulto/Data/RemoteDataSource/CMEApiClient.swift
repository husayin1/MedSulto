//
//  CMERemoteSource.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation

class CMEApiClient: APIClient,CMEsAPIProtocol{
    
    func fetchAllCourses() async throws -> Result<CMELandingResponse, NetworkError> {
        return try await performRequest(route: CMEAPIRoute.getCMELandingPage)
    }
    
    func searchForCoursesBy(name: String) async throws -> Result<CMELandingResponse, NetworkError> {
        return try await performRequest(route: CMEAPIRoute.searchForCoursesWith(name: name))
    }
    func fetchAllUserCertificates() async throws -> Result<CertificateResponse, NetworkError> {
        return try await performRequest(route: CMEAPIRoute.getCertificatesList)
    }
}
