//
//  ProductDetailViewControllerTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/7/22.
//

import XCTest
@testable import Dubizzle

class ProductDetailViewControllerTests: XCTestCase {

    var sut: ProductDetailViewController!
    var mockProductDetailInterface: MockProductDetailView!
    var mockProductDetailPresenter: MockProductDetailPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockProductDetailInterface = MockProductDetailView()
        mockProductDetailPresenter = MockProductDetailPresenter()
        sut = ProductDetailViewController(userInterface: mockProductDetailInterface)
        sut.presenter = mockProductDetailPresenter
    }
    
    func test_viewLoaded_notifiesPresenter() {
        let _ = sut.view
        XCTAssert(mockProductDetailPresenter.viewLoadedCalled)
    }
    
    func test_displayProductDetail_notifiesView() {
        let model = ProductDetailViewModel(id: "", imageURL: nil, title: "", price: "", postedOn: "")
        sut.displayProductDetail(with: model)
        XCTAssert(mockProductDetailInterface.setupDataCalled)
        XCTAssert(mockProductDetailInterface.viewModel == model)
    }

}
