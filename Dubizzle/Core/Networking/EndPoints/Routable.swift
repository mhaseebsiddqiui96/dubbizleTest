//
//  Router.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import Foundation

enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

typealias APIParams = [String: Any]?
typealias APIHeaders = [String: String]
typealias APIMehtod = APIMethod

enum EncodingType {
    case urlEncoding
    case jsonEncoding
}

protocol Routable {
    /// baseURL for calling any server
    var baseURLString: String { get }
    
    /// by default method is HTTPMethod.get
    var method: APIMehtod { get }
    
    /// path should be appended with baseURL
    var path: String { get }
    var params: APIParams? { get }
    var headers: APIHeaders? { get }
    var parameterEncoding: EncodingType { get }

}

extension Routable {
    
    var baseURLString: String { return
        "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    }
}
