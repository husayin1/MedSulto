//
//  CMERemoteSource.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
class CMERemoteSource: APIClient,RemoteDataSource {
    
    func getAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError> {
        return performRequest(route: APIRoute.getCMELandingPage)
    }
    func searchForCoursesBy(name: String) -> AnyPublisher<CMELandingResponse, NetworkError> {
        return performRequest(route: APIRoute.searchForCoursesWith(name: name))
    }
    
}
