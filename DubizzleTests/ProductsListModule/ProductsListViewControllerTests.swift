//
//  DubizzleTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/5/22.
//

import XCTest
@testable import Dubizzle

class ProductsListViewControllerTests: XCTestCase {

    var sut: ProductsListViewController!
    var mockProductListInterface: MockProductListView!
    var mockProductsListPresenter: MockProductListPresenter!
    
    override func setUpWithError() throws {
        mockProductListInterface = MockProductListView()
        mockProductsListPresenter = MockProductListPresenter()
        sut = ProductsListViewController(userInterface: mockProductListInterface)
        sut.presenter = mockProductsListPresenter
    }
   
    func test_viewDidLoad_setsDataSoruceAndDelegate() {
        let _ = sut.view
        XCTAssert(mockProductListInterface.setDatasourceAndDelegateCalled)
    }
    
    func test_viewDidLoad_notifiesPresenter() {
        let _ = sut.view
        XCTAssert(mockProductsListPresenter.viewLoadedCalled)
    }
    
    func test_displayProductList_reloadsProducts() {
        let _ = sut.view
        
        sut.displayProductList(with: [])
        XCTAssert(mockProductListInterface.reloadListOfProductsCalled)
    }
    
    func test_displayLoader_showsActivityView() {
        let _ = sut.view
        
        sut.displayLoader()
        XCTAssert(mockProductListInterface.showActivityIndicatorCalled)
    }
    
    func test_displayLoader_hidesActivityView() {
        let _ = sut.view
        
        sut.hideLoader()
        XCTAssert(mockProductListInterface.hideActivityIndicatorCalled)
    }
    
    func test_showError_notifiesView() {
        let _ = sut.view
        sut.displayErrorMsg("error")
        XCTAssertNotNil(mockProductListInterface.showErrorCalledMessage)
        XCTAssert((mockProductListInterface.showErrorCalledMessage ?? "") == "error")
    }

}


