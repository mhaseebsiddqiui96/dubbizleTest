//
//  ProductListItemViewModelTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import XCTest
@testable import Dubizzle

class ProductListItemViewModelTests: XCTestCase {

    var sut: ProductListItemViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_viewModelIntilization_withCorrectData() {
        let urlSring = "https://en.wikipedia.org/wiki/Google_Images#/media/File:Google_Images_2015_logo.svg"
        
        sut = ProductListItemViewModel(from: ProductEntity(id: "id1", createdAt: nil, price: "price1", name: "title1", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: [urlSring]), cellTapped: {})
        
        XCTAssert(sut.title == "title1")
        XCTAssert(sut.price == "price1")
        XCTAssert(sut.id == "id1")
        XCTAssert(sut.imageURL == URL(string: urlSring))
    }
    
    func test_viewModelIntilization_withMissingData() {

        // missing title and price
        sut = ProductListItemViewModel(from: ProductEntity(id: "id1", createdAt: nil, price: nil, name: nil, imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil), cellTapped: {})
        
        XCTAssert(sut.title == "--")
        XCTAssert(sut.price == "--")
        XCTAssert(sut.id == "id1")
        XCTAssert(sut.imageURL == nil)
    }
}
