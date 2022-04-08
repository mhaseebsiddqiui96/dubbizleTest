//
//  ProductListItemViewModel.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import Foundation

struct ProductListItemViewModel: Identifiable {
    let id: String
    let imageURL: URL?
    let title: String
    let price: String
    var cellTapped: (() -> Void)?
}

extension ProductListItemViewModel {
    init(from productEntity: ProductEntity, cellTapped: @escaping () -> Void) {
        
        self.title = productEntity.name ?? "--"
        self.imageURL = URL(string: productEntity.imageUrlsThumbnails?.first ?? "")
        self.price = productEntity.price ?? "--"
        self.id = productEntity.id // used for mapping purpose
        self.cellTapped = cellTapped
    }
}
