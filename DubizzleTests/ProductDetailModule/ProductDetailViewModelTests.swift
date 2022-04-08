//
//  ProductDetailViewModelTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/7/22.
//

import XCTest
@testable import Dubizzle

class ProductDetailViewModelTests: XCTestCase {

    var sut: ProductDetailViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_initialization_withCorrectData() {
        
        sut = ProductDetailViewModel(from: ProductEntity(id: "id1", createdAt: "createdAt1", price: "price1", name: "name1", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil))
        
        XCTAssert(sut.price == "price1")
        XCTAssert(sut.title == "name1")
        XCTAssert(sut.id == "id1")
        XCTAssert(sut.postedOn == "createdAt1")
    }
    
    func test_initialization_withMissingData() {
        
        sut = ProductDetailViewModel(from: ProductEntity(id: "id1", createdAt: nil, price: nil, name: nil, imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil))
        
        XCTAssert(sut.price == "--")
        XCTAssert(sut.title == "--")
        XCTAssert(sut.id == "id1")
        XCTAssert(sut.postedOn == "--")
    }

}
