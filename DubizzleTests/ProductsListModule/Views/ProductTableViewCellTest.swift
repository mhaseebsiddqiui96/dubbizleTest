//
//  ProductTableViewCellTest.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import XCTest
@testable import Dubizzle

class ProductTableViewCellTest: XCTestCase {

    var sut: ProductTableViewCell!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ProductTableViewCell()
    }

    func test_setupData_rendersProductInfo() {
        sut.setupData(ProductListItemViewModel(id: "id1", imageURL: URL(string: "https://en.wikipedia.org/wiki/Google_Images#/media/File:Google_Images_2015_logo.svg"), title: "title1", price: "price1", cellTapped: nil))
        
        XCTAssert(sut.productNameLabel.text == "title1")
        XCTAssert(sut.productPriceLabel.text == "price1")
        
        
    }
}
