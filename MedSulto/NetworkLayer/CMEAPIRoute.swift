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
        return .authorization
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.rawValue.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.any.rawValue, forHTTPHeaderField: HTTPHeaderField.accept.rawValue)
        if let headerField = authorizationHeader {
            urlRequest.setValue(headerField.token, forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
        }
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
}
