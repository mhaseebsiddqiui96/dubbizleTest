//
//  ProductEntity.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import Foundation

class ProductEntity: Identifiable, Equatable {
    static func == (lhs: ProductEntity, rhs: ProductEntity) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    let id: String
    let createdAt: String?
    let price: String?
    let name: String?
    let imageIDs: [String]?
    let imageURLs: [String]?
    let imageUrlsThumbnails: [String]?
    
    internal init(id: String, createdAt: String?, price: String?, name: String?, imageIDs: [String]?, imageURLs: [String]?, imageUrlsThumbnails: [String]?) {
        self.id = id
        self.createdAt = createdAt
        self.price = price
        self.name = name
        self.imageIDs = imageIDs
        self.imageURLs = imageURLs
        self.imageUrlsThumbnails = imageUrlsThumbnails
    }
    
}

extension ProductEntity {
    convenience init(productApiModel: APIProductModel) {
        
        self.init(
            id: productApiModel.uid ?? UUID().uuidString,
            createdAt: productApiModel.created_at,
            price: productApiModel.price,
            name: productApiModel.name,
            imageIDs: productApiModel.image_ids,
            imageURLs: productApiModel.image_urls,
            imageUrlsThumbnails: productApiModel.image_urls_thumbnails)
        
    }
}


