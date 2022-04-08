//
//  ProductDetailViewModel.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/5/22.
//

import Foundation

struct ProductDetailViewModel: Identifiable, Equatable {
    let id: String
    let imageURL: URL?
    let title: String
    let price: String
    let postedOn: String
}

extension ProductDetailViewModel {
    init(from productEntity: ProductEntity) {
        
        self.title = productEntity.name ?? "--"
        self.imageURL = URL(string: productEntity.imageURLs?.first ?? "")
        self.price = productEntity.price ?? "--"
        self.id = productEntity.id // used for mapping purpose
        self.postedOn = productEntity.createdAt ?? "--"
    }
}
