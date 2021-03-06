//
//  ProductsListInteractor.swift
//  Dubizzle
//
//  Created Muhammad Haseeb Siddiqui on 4/4/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Muhammad Haseeb Siddiqui
//

import UIKit

class ProductsListInteractor: ProductsListInteractorInputProtocol {

    weak var presenter: ProductsListInteractorOutputProtocol?
    let productListService: ProductsListServiceProtocol
    
    var productList: [ProductEntity] = []
    
    init(productListService: ProductsListServiceProtocol) {
        self.productListService = productListService
    }
    
    
    //Use case
    func getProductsList() {
        self.productListService.getProducstList {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.handleSuccessResponseOfGetProducts(with: model)
            case .failure(let error):
                self.presenter?.presentErrorInFetchingProductsList(with: error)
            }
        }
    }
    
    private func handleSuccessResponseOfGetProducts(with productsList: APIProductsListModel) {
        if let products = productsList.results, !products.isEmpty {
            self.productList = products.map({ProductEntity(productApiModel: $0)})
            presenter?.presentListOfProducts(productList)
        } else {
            presenter?.presentListOfProducts([])
        }
    }
}
