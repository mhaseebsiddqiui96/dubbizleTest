//
//  ProductDetailViewTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/7/22.
//

import XCTest
@testable import Dubizzle

class ProductDetailViewTests: XCTestCase {

    var sut: ProductDetailView!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ProductDetailView()
    }
    
    func test_setupData() {
        let url = URL(string: "https://en.wikipedia.org/wiki/Google_Images#/media/File:Google_Images_2015_logo.svg")
        
        sut.setupData(ProductDetailViewModel(id: "id1", imageURL: url, title: "title1", price: "price1", postedOn: "postedOn1"))
        
        XCTAssert(sut.priceLabel.text == "price1")
        XCTAssert(sut.titleLabel.text == "title1")
    }

}
