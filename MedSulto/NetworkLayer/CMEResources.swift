//
//  API.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation

enum MedSultoResource {
    case cmeLandingPage
    case searchForCoursesWith
    case certificatesList
    var endpoint: String {
        switch self {
        case .cmeLandingPage, .searchForCoursesWith:
            return "GetCMELandingPage"
        case .certificatesList:
            return "GetCertificatesList"
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
            return "Bearer \(Constants.bearerToken.rawValue)"
        }
    }
}


