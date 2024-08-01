//
//  CMEAPIRoute.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Alamofire

enum CMEAPIRoute: URLRequestConvertible {
    
    case getCMELandingPage
    case searchForCoursesWith(name: String)
    case getCertificatesList
    

    var method: HTTPMethod {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith, .getCertificatesList:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith, .getCertificatesList:
            return URLEncoding.default
        }
    }
    
    var parameters: [String: Any]? {
            switch self {
            case .getCMELandingPage, .getCertificatesList:
                return nil
            case .searchForCoursesWith(let name):
                return ["SearchKeyword" : name]
            }
        }
    
    
    
    var path: String {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith:
            return MedSultoResource.cmeLandingPage.endpoint
        case .getCertificatesList:
            return MedSultoResource.certificatesList.endpoint

        }
    }
    
    var authorizationHeader: HTTPHeaderField? {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith, .getCertificatesList:
            return .authorization
        }
    }
    var authorizationType: AuthorizationType {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith, .getCertificatesList:
            return .bearer
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.rawValue.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.any.rawValue, forHTTPHeaderField: HTTPHeaderField.accept.rawValue)
        urlRequest.setValue(AuthorizationType.bearer.headerValue(), forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)

        if let headerField = authorizationHeader {
            urlRequest.setValue(authorizationType.headerValue(), forHTTPHeaderField: headerField.rawValue)
        }
        
        return try encoding.encode(urlRequest, with: parameters)
    }


}
