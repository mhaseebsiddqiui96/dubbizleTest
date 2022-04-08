//
//  ProductEndpoint.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import Foundation


enum ProductListEndpoint: Routable {
   
    case getProductList
    
    var path: String {
        switch self {
        case .getProductList:
            return baseURLString + "default/dynamodb-writer"
        }
    }
    var params: APIParams? {
        return nil
    }
    
    var method: APIMehtod {
        switch self {
        case .getProductList:
            return .get
        }
    }
    
    var headers: APIHeaders? {
       return nil
    }
    
    var parameterEncoding: EncodingType {
        switch self {
        case .getProductList:
            return .urlEncoding
        }
    }
}
