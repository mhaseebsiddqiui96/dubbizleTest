//
//  Mocks.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import UIKit
@testable import Dubizzle

class MockProductListView: UIView, ProductsListInterface {
    
    
    var showActivityIndicatorCalled = false
    var hideActivityIndicatorCalled = false
    var setDatasourceAndDelegateCalled = false
    var reloadListOfProductsCalled = false
    var showErrorCalledMessage: String?
    
    func showActivityIndicator() {
        showActivityIndicatorCalled = true
    }
    
    func hideActivityIndicator() {
        hideActivityIndicatorCalled = true
    }
  
    
    func setDataSourceAndDelegateForProductsTableView(_ source: UITableViewDataSource & UITableViewDelegate) {
        setDatasourceAndDelegateCalled = true
    }
    
    func reloadListOfProducts() {
        reloadListOfProductsCalled = true
    }
    
    func showError(with message: String) {
        showErrorCalledMessage = message
    }
}

class MockProductListPresenter: ProductsListPresenterProtocol {
    
    var viewLoadedCalled = false
    var interactor: ProductsListInteractorInputProtocol?
    
    var listOfProductsViewModel: [ProductListItemViewModel] = []
    
    func viewLoaded() {
        viewLoadedCalled = true
    }

}

class MockProductListViewController: ProductsListViewProtocol {
    
    var presenter: ProductsListPresenterProtocol?
    
    var displayProductListCalled: Bool = false
    var displayLoaderCallaed: Bool = false
    var hideLoaderCalled: Bool = false
    var dislayErrorMsgCalled: Bool = false
    var viewModels = [ProductListItemViewModel]()
    
    func displayProductList(with viewModels: [ProductListItemViewModel]) {
        self.displayProductListCalled = true
        self.viewModels = viewModels
    }
    
    func displayLoader() {
        displayLoaderCallaed = true
    }
    
    func hideLoader() {
        hideLoaderCalled = true
    }
    
    func displayErrorMsg(_ message: String) {
        dislayErrorMsgCalled = true
    }
}

class MockProductListInteractor: ProductsListInteractorInputProtocol {
    var presenter: ProductsListInteractorOutputProtocol?
    var getProductListCalled: Bool = false
    
    func getProductsList() {
        getProductListCalled = true
    }
    
}

class MockProductListRouter: ProductsListWireframeProtocol {
    
    var routeToDetailCalled: Bool = false
    
    func routeToProductDetail(with entitiy: ProductEntity) {
        routeToDetailCalled = true
    }
}


class MockProductListService: ProductsListServiceProtocol {
    var model: APIProductsListModel?
    var getProducstListCalled: Bool = false
    func getProducstList(completion: @escaping ((APIResult<APIProductsListModel>) -> Void)) {
        getProducstListCalled = true
        if let model = model {
            completion(.success(model))
        } else {
            completion(.failure(DummyError()))
        }
    }
}

class MockProductListInteractorOutput: ProductsListInteractorOutputProtocol {
    var presentListOfProductsCalled = false
    var products: [ProductEntity] = []
    
    var presentErrorInFetchingProductsList: Error?
    
    func presentListOfProducts(_ products: [ProductEntity]) {
        self.products = products
        self.presentListOfProductsCalled = true
    }
    
    func presentErrorInFetchingProductsList(with error: Error) {
        presentErrorInFetchingProductsList = error
    }
    
    
}

class DummyError: Error {
    
}

//helper
class MockJSONLoader {
    func getAPIModel() ->  APIProductsListModel? {
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "ProductListJSON", withExtension: "json") else {
            return nil
        }
        let json = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        let apiModel = try? decoder.decode(APIProductsListModel.self, from: json)
        
        return apiModel
    }
}
