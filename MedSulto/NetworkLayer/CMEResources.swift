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

extension HTTPHeaderField {
    var token: String {
        switch self {
        case .authorization:
            return "Bearer \(Constants.bearerToken.rawValue)"
        default:
            return self.rawValue
        }
    }
}

enum ContentType: String {
    case json = "application/json"
    case any = "*/*"
}

