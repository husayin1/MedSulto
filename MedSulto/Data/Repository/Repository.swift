//
//  Repository.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
class Repository: RepositoryProtocol {
    let networkService: RemoteDataSource
    
    init(networkService: RemoteDataSource) {
        self.networkService = networkService
    }
    
    //this is new edit
    func getAllCourses() -> AnyPublisher<CMELandingResponse, NetworkError> {
        return networkService.getAllCourses()
    }
}

