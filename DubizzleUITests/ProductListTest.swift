//
//  DubizzleUITests.swift
//  DubizzleUITests
//
//  Created by Muhammad Haseeb Siddiqui on 4/8/22.
//

import XCTest

class ProductListTest: XCTestCase {


    override func setUpWithError() throws {
       
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
    }

    func test_productList_displayInitialState() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.navigationBars[UIElementsIdentifiers.ProductList.navbar].exists)
        XCTAssert(app.navigationBars[UIElementsIdentifiers.ProductList.navbar].staticTexts[AppStrings.productListNavbarTitle].exists )
        XCTAssert(app.activityIndicators[UIElementsIdentifiers.ProductList.showLoader].exists)
        XCTAssert(app.tables[UIElementsIdentifiers.ProductList.initialProductsTableView].exists)

        
    }

    //Ideally i should have used mocking for api response but i dont have enough time due to workload :(
    func test_productList_displayDataLoadedState() throws {
        let app = XCUIApplication()
        app.launch()
        
        //checking tableview existance
        XCTAssert(app.tables[UIElementsIdentifiers.ProductList.finalProductsTableView].waitForExistence(timeout: 10))
        //loader should hide
        XCTAssert(!app.activityIndicators[UIElementsIdentifiers.ProductList.showLoader].exists)
    }
    
    func test_cellTap_displayDetail() throws {
        let app = XCUIApplication()
        app.launch()
        
        //checking tableview existance
        XCTAssert(app.tables[UIElementsIdentifiers.ProductList.finalProductsTableView].waitForExistence(timeout: 10))
        
        //Tapping cell
        XCTAssert(app.tables[UIElementsIdentifiers.ProductList.finalProductsTableView].cells.count > 0)
        let cell = app.tables[UIElementsIdentifiers.ProductList.finalProductsTableView].cells.element(boundBy: 0)
        cell.tap()
        
        //chekcng detail screen if it exist or not
        XCTAssert(app.navigationBars[UIElementsIdentifiers.ProductList.navbar].staticTexts[AppStrings.productDetailsNavbarTitle].exists )

    }

    
}


class FileReader {

    static var shared = FileReader()
    private var fileData: Data = Data()

    private func updateData(fileData: Data) {
        self.fileData = fileData
    }
    private func getData() -> Data {
        return self.fileData
    }

    func parseFile(resource: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                FileReader.shared.updateData(fileData: data)
                return data
                
            } catch {
                return nil
            }
        }
        
        return nil
    }
}
