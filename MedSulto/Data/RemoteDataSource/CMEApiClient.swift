//
//  CMERemoteSource.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
class CMEApiClient: APIClient,CMEAPIClientProtocol{
    
    func fetchAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError> {
        return performRequest(route: CMEAPIRoute.getCMELandingPage)
    }
    
    func searchForCoursesBy(name: String) -> AnyPublisher<CMELandingResponse, NetworkError> {
        return performRequest(route: CMEAPIRoute.searchForCoursesWith(name: name))
    }
    func fetchAllUserCertificates() -> AnyPublisher<CertificateResponse, NetworkError> {
        return performRequest(route: CMEAPIRoute.getCertificatesList)
    }
}
