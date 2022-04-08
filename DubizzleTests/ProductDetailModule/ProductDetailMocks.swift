//
//  Mocks.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/7/22.
//

import UIKit

@testable import Dubizzle

class MockProductDetailView: UIView, ProductDetailInterface {
    
    var setupDataCalled: Bool = false
    var viewModel: ProductDetailViewModel!
    func setupData(_ viewModel: ProductDetailViewModel) {
        setupDataCalled = true
        self.viewModel = viewModel
    }
    
}

class MockProductDetailPresenter: ProductDetailPresenterProtocol {
    var viewLoadedCalled: Bool = false
    var interactor: ProductDetailInteractorInputProtocol?
    
    func viewLoaded() {
        viewLoadedCalled = true
    }
}

class MockProductDetailViewController: ProductDetailViewProtocol {
    var presenter: ProductDetailPresenterProtocol?
    var displayProductDetailCalled: Bool = false
    
    func displayProductDetail(with viewModel: ProductDetailViewModel) {
        displayProductDetailCalled = true
    }
    
}

class MockProductDetailInteractorInput: ProductDetailInteractorInputProtocol {
    var presenter: ProductDetailInteractorOutputProtocol?
    var getProductDetailsCalled: Bool = false
    func getProductDetails() {
        getProductDetailsCalled = true
    }
    
    
}

class MockProductDetailInteractorOutput: ProductDetailInteractorOutputProtocol {
    var presentProductDetailsCalled: Bool = false
    var entity: ProductEntity!
    func presentProductDetails(with entity: ProductEntity) {
        presentProductDetailsCalled = true
        self.entity = entity
    }

}

class MockProductDetailRouter: ProductDetailWireframeProtocol {


}
