//
//  APIRoute.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Alamofire

enum APIRoute: URLRequestConvertible {
    
    case getCMELandingPage
    case searchForCoursesWith(name: String)
    

    var method: HTTPMethod {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith:
            return URLEncoding.default
        }
    }
    
    var parameters: [String: Any]? {
            switch self {
            case .getCMELandingPage:
                return nil
            case .searchForCoursesWith(let name):
                return ["SearchKeyword" : name]
            }
        }
    
    
    
    var path: String {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith:
            return MedSultoResource.cmeLandingPage.endpoint

        }
    }
    
    var authorizationHeader: HTTPHeaderField? {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith:
            return .authorization
        }
    }
    var authorizationType: AuthorizationType {
        switch self {
        case .getCMELandingPage, .searchForCoursesWith:
            return .bearer
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try EndPoint.baseUrl.asURL()
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
