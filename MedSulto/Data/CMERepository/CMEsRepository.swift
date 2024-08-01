//
//  CMEsRepository.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
class CMEsRepository: CMEsRepositoryProtocol {
    
    let cmeNetworkService: CMEAPIClientProtocol
    
    init() {
        self.cmeNetworkService = CMEApiClient()
    }
    
    //this is new edit
    func getAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError> {
        return cmeNetworkService.fetchAllCourses()
    }
    
    func getSearchResult(name: String) -> AnyPublisher<CMELandingResponse, NetworkError> {
        return cmeNetworkService.searchForCoursesBy(name: name)
    }
    
    func getAllUserCertificates() -> AnyPublisher<CertificateResponse, NetworkError> {
        return cmeNetworkService.fetchAllUserCertificates()
    }
}



