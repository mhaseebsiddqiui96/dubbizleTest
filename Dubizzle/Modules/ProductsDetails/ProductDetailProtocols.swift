//
//  ProductDetailProtocols.swift
//  Dubizzle
//
//  Created Muhammad Haseeb Siddiqui on 4/4/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Muhammad Hassan Asim
//

import Foundation

// MARK: Wireframe -
protocol ProductDetailWireframeProtocol: AnyObject {

}
// MARK: Presenter -
protocol ProductDetailPresenterProtocol: AnyObject {

    var interactor: ProductDetailInteractorInputProtocol? { get set }
    func viewLoaded()
}

// MARK: Interactor -
protocol ProductDetailInteractorOutputProtocol: AnyObject {

    /* Interactor -> Presenter */
    func presentProductDetails(with entity: ProductEntity)
}

protocol ProductDetailInteractorInputProtocol: AnyObject {

    var presenter: ProductDetailInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
    func getProductDetails()
}

// MARK: View -
protocol ProductDetailViewProtocol: AnyObject {

    var presenter: ProductDetailPresenterProtocol? { get set }

    /* Presenter -> ViewController */
    func displayProductDetail(with viewModel: ProductDetailViewModel)
}
