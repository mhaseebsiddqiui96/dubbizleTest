//
//  ProductsListPresenterTest.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import XCTest
@testable import Dubizzle

class ProductsListPresenterTest: XCTestCase {

    var sut: ProductsListPresenter!
    var mockProductListView: MockProductListViewController!
    var mockProductListIntractor: MockProductListInteractor!
    var router: MockProductListRouter!
    
    override func setUpWithError() throws {
        mockProductListView = MockProductListViewController()
        mockProductListIntractor = MockProductListInteractor()
        router = MockProductListRouter()
        sut = ProductsListPresenter(interface: mockProductListView, interactor: mockProductListIntractor, router: router)
    }
    
    func test_viewLoaded_presentLoader() {
        sut.viewLoaded()
        XCTAssert(mockProductListView.displayLoaderCallaed)
    }
    
    func test_viewLoaded_getProductList() {
        sut.viewLoaded()
        XCTAssert(mockProductListIntractor.getProductListCalled)
    }
    
    func test_presentListOfProducts_notifiesView() {
        sut.presentListOfProducts([ProductEntity(id: "id1", createdAt: "createAt1", price: "price1", name: "name1", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil)])
        
        XCTAssert(mockProductListView.hideLoaderCalled)
        XCTAssert(mockProductListView.displayProductListCalled)
        XCTAssert(mockProductListView.viewModels.count == 1)
        
    }
    
    func test_presentListOfProducts_storesListAsViewModel() {
        sut.presentListOfProducts([ProductEntity(id: "id1", createdAt: "createAt1", price: "price1", name: "name1", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil)])
        XCTAssert(sut.listOfProductsViewModel.count == 1)
        
        let viewModel = sut.listOfProductsViewModel[0]
        XCTAssert(viewModel.title == "name1")
        XCTAssert(viewModel.price == "price1")
        XCTAssert(viewModel.id == "id1")
    }
    
    func test_presentErrorInFetchingList_notifiesView() {
       
        sut.presentErrorInFetchingProductsList(with: DummyError())
        XCTAssert(mockProductListView.dislayErrorMsgCalled)
    }
    
    func test_productItemSelection_routeToDetail() {
        sut.presentListOfProducts([ProductEntity(id: "id1", createdAt: "createAt1", price: "price1", name: "name1", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil)])
        
        XCTAssert(!router.routeToDetailCalled)
        mockProductListView.viewModels[0].cellTapped?()
        XCTAssert(router.routeToDetailCalled)
    }
    
}
