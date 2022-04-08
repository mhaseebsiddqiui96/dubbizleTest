//
//  ProductsListServiceProtocol.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import Foundation

protocol ProductsListServiceProtocol {
 
    func getProducstList(completion: @escaping((APIResult<APIProductsListModel>) -> Void))
   
}

class ProductsListService: BaseAPIClient, ProductsListServiceProtocol {
    func getProducstList(completion: @escaping((APIResult<APIProductsListModel>) -> Void)) {
      
        let endPoint = ProductListEndpoint.getProductList
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        super.request(route: endPoint, decoder: decoder, completion: completion)
    }
}
