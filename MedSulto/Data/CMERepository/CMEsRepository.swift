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
    func getAllCourses() async -> Result<CMELandingResponse, NetworkError> {
        return await cmeApiClient.fetchAllCourses()
    }
    
    func getSearchResult(name: String) async -> Result<CMELandingResponse, NetworkError> {
        return await cmeApiClient.searchForCoursesBy(name: name)
    }
    
    func getAllUserCertificates() async -> Result<CertificateResponse, NetworkError> {
        return await cmeApiClient.fetchAllUserCertificates()
    }
}



