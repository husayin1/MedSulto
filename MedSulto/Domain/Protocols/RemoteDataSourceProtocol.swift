//
//  APIClientType.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
protocol RemoteDataSource {
    func getAllCourses()-> AnyPublisher<CMELandingResponse, NetworkError>
    func searchForCoursesBy(name: String) -> AnyPublisher<CMELandingResponse, NetworkError> 
}
