//
//  ProductsListViewTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import XCTest
@testable import Dubizzle

class ProductsListViewTests: XCTestCase {

    var sut: ProductsListView!
    var productListdataSource: ProductListDatasourceAndDelegate!
    override func setUpWithError() throws {
        sut = ProductsListView()
        productListdataSource = ProductListDatasourceAndDelegate()
        
        sut.setDataSourceAndDelegateForProductsTableView(productListdataSource)
    }
    
    
    func test_reloadListOfProducts_rendersProducts() {
        
        setOneItemAndReload()
        XCTAssert(sut.productsTableView.numberOfRows(inSection: 0) == 1)
        
        setTwoItemsAndReload()
        XCTAssert(sut.productsTableView.numberOfRows(inSection: 0) == 2)
    }
    
    func test_reloadListOfProducts_rendersProductDetails() {
        
       setOneItemAndReload()
       XCTAssertNotNil(sut.productsTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ProductTableViewCell)
        
        let cell = sut.productsTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ProductTableViewCell
        
        XCTAssert(cell.productNameLabel.text == "product1")
        XCTAssert(cell.productPriceLabel.text == "price1")
        
    }
    
    func test_productSelection_notifiesClosureInViewModel() {
        let expectation = expectation(description: "callback called for cell selection")
        
        productListdataSource.setModels([ProductListItemViewModel(id: "id1", imageURL: nil, title: "product1", price: "price1", cellTapped: {
            expectation.fulfill()
        })])
              
        //reloading data
        sut.reloadListOfProducts()

    
        // selecting first cell
        sut.productsTableView.delegate?.tableView?(sut.productsTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }

    }
    
    //Helpers for mock data
    func setOneItemAndReload() {
        productListdataSource.setModels([ProductListItemViewModel(id: "id1", imageURL: nil, title: "product1", price: "price1")])
                
        sut.reloadListOfProducts()
    }
    
    
    fileprivate func setTwoItemsAndReload() {
        productListdataSource.setModels([
            ProductListItemViewModel(id: "id1", imageURL: nil, title: "product1", price: "price1"),
            ProductListItemViewModel(id: "id2", imageURL: nil, title: "product2", price: "price2")
        ])
        
        sut.reloadListOfProducts()
    }
    
}

