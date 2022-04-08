//
//  ProductsListInteractorTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import XCTest
@testable import Dubizzle

class ProductsListInteractorTests: XCTestCase {

    var sut: ProductsListInteractor!
    var productListService: MockProductListService!
    var mockProductListinteractorOutput: MockProductListInteractorOutput!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        productListService = MockProductListService()
        sut = ProductsListInteractor(productListService: productListService)
        mockProductListinteractorOutput = MockProductListInteractorOutput()
        sut.presenter = mockProductListinteractorOutput
    }
    
    func test_getProductList_notifiesPresenterWithProducts() {
        //pre req
        let jsonLoader = MockJSONLoader()
        productListService.model = jsonLoader.getAPIModel()
        
        sut.getProductsList()
        
        XCTAssert(productListService.getProducstListCalled)
        XCTAssert(mockProductListinteractorOutput.presentListOfProductsCalled)
        
        //Testing product details
        XCTAssert(mockProductListinteractorOutput.products.count == 2)
        XCTAssert(mockProductListinteractorOutput.products[0].name == "Notebook")
        XCTAssert(mockProductListinteractorOutput.products[0].price == "AED 5")
        XCTAssert(mockProductListinteractorOutput.products[0].createdAt == "2019-02-24 04:04:17.566515")

    }
    
    func test_getProductList_notifiesPresenterWithErrorInFetch() {
        productListService.model = nil
        
        sut.getProductsList()
        
        XCTAssert(productListService.getProducstListCalled)
        XCTAssertNotNil(mockProductListinteractorOutput.presentErrorInFetchingProductsList)
    }

}
