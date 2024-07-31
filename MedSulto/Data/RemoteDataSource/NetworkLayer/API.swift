//
//  API.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation

struct EndPoint: API {
    static let baseUrl = "https://medsulto-medsulto-mock.azurewebsites.net/api/CME/"
    static let bearerToken = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMjMzMzMzMzMzIiwibmFtZWlkIjoiNy8zMS8yMDI0IDc6MDA6NDEgQU0iLCJyb2xlIjoiR3Vlc3RSb2xlIiwibmJmIjoxNzIyNDA5MjQxLCJleHAiOjE3MjI2Njg0NDEsImlhdCI6MTcyMjQwOTI0MX0.OuoHwE_NhF6szqvlfJiqQNZP7YB_k_6s8ySPKC5l_gF6Qlwr_ODzbQbNBLrqZ4rzjyB49GoMzijSYuVVghg3eQ"

}

enum MedSultoResource {
    case cmeLandingPage

    var endpoint: String {
        switch self {
        case .cmeLandingPage:
            return "GetCMELandingPage"
        }
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
    case accept = "Accept"
}

enum ContentType: String {
    case json = "application/json"
    case any = "*/*"
}

enum AuthorizationType {
    case bearer
    
    func headerValue() -> String {
        switch self {
        case .bearer:
            return "Bearer \(EndPoint.bearerToken)"
        }
    }
}


