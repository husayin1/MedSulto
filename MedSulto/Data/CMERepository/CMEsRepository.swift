//
//  CMEsRepository.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
class CMEsRepository: CMEsRepositoryProtocol {
    
    let cmeApiClient: CMEsAPIProtocol
    
    init() {
        self.cmeApiClient = CMEApiClient()
    }
    
    //this is new edit
    func getAllCourses() async throws -> Result<CMELandingResponse, NetworkError> {
        return try await cmeApiClient.fetchAllCourses()
    }
    
    func getSearchResult(name: String) async throws -> Result<CMELandingResponse, NetworkError> {
        return try await cmeApiClient.searchForCoursesBy(name: name)
    }
    
    func getAllUserCertificates() async throws -> Result<CertificateResponse, NetworkError> {
        return try await cmeApiClient.fetchAllUserCertificates()
    }
}



