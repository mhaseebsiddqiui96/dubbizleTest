//
//  ProductDetailInteractorTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/7/22.
//

import XCTest
@testable import Dubizzle

class ProductDetailInteractorTests: XCTestCase {

    var sut: ProductDetailInteractor!
    var mockProductDetailInteractorOutput: MockProductDetailInteractorOutput!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    func test_getProductDetail_notifiesPresenter() {
        
        let model1 = ProductEntity(id: "id1", createdAt: "", price: "", name: "", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil)
        
        createSut(with: model1)
        sut.getProductDetails()
        
        XCTAssert(mockProductDetailInteractorOutput.presentProductDetailsCalled)
        XCTAssert(mockProductDetailInteractorOutput.entity == model1)
        
        let model2 = ProductEntity(id: "id2", createdAt: "", price: "", name: "", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil)
        
        createSut(with: model2)
        sut.getProductDetails()

        XCTAssert(mockProductDetailInteractorOutput.presentProductDetailsCalled)
        XCTAssert(mockProductDetailInteractorOutput.entity == model2)
    }

    func createSut(with model: ProductEntity) {
        
        mockProductDetailInteractorOutput = MockProductDetailInteractorOutput()
        sut = ProductDetailInteractor(product: model)
        sut.presenter = mockProductDetailInteractorOutput
    }
}
