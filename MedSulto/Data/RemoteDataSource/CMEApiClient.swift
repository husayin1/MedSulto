//
//  CMERemoteSource.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation

class CMEApiClient: APIClient,CMEsAPIProtocol{
    
    func fetchAllCourses() async -> Result<CMELandingResponse, NetworkError> {
        return await performRequest(route: CMEAPIRoute.getCMELandingPage)
    }
    
    func searchForCoursesBy(name: String) async -> Result<CMELandingResponse, NetworkError> {
        return await performRequest(route: CMEAPIRoute.searchForCoursesWith(name: name))
    }
    func fetchAllUserCertificates() async -> Result<CertificateResponse, NetworkError> {
        return await performRequest(route: CMEAPIRoute.getCertificatesList)
    }
}
