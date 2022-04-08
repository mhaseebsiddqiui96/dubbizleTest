//
//  ProductDetailPresenterTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/7/22.
//

import XCTest
@testable import Dubizzle

class ProductDetailPresenterTests: XCTestCase {

    var sut: ProductDetailPresenter!
    var mockProductDetailInterface: MockProductDetailViewController!
    var mockProductDetailInteractor: MockProductDetailInteractorInput!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockProductDetailInterface = MockProductDetailViewController()
        mockProductDetailInteractor = MockProductDetailInteractorInput()
        
        sut = ProductDetailPresenter(interface: mockProductDetailInterface, interactor: mockProductDetailInteractor, router: MockProductDetailRouter())
    }
    
    func test_viewLoaded_notifiesPresenter() {
        sut.viewLoaded()
        XCTAssert(mockProductDetailInteractor.getProductDetailsCalled)
    }
    
    func test_presentProductDetails_notifiesView() {
        sut.presentProductDetails(with: ProductEntity(id: "", createdAt: "", price: "", name: "", imageIDs: nil, imageURLs: nil, imageUrlsThumbnails: nil))
        XCTAssert(mockProductDetailInterface.displayProductDetailCalled)
    }
}
