//
//  ProductEntityTests.swift
//  DubizzleTests
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import XCTest
@testable import Dubizzle

class ProductEntityTests: XCTestCase {

    var sut: ProductEntity!
    override func setUpWithError() throws {
        
        
    }
    
    func test_initialize_withCorrectData() {
        let JSONloader = MockJSONLoader()
        let model = JSONloader.getAPIModel()!.results![0]
        sut = ProductEntity(productApiModel: model)
        
        XCTAssert(sut.price == "AED 5")
        XCTAssert(sut.name == "Notebook")
        XCTAssert(sut.createdAt == "2019-02-24 04:04:17.566515")
        XCTAssert(sut.id == "4878bf592579410fba52941d00b62f94")
        XCTAssert(sut.imageIDs == ["9355183956e3445e89735d877b798689"])
        XCTAssert(sut.imageURLs == ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4XBWLE6PR&Signature=D0f1cIuFXkbGxU62ISLbp%2B5reWg%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCE1hTraPP2qnlS3zM%2BHxMyvlPN5RYs8MNhMKQrJ0aGVwIge0WYcxyNVHe%2FyAVMAbCXRreBdo2ACQxBV0kmHGHoabkqnQIImP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARADGgwxODQzOTg5NjY4NDEiDD6C%2FqdfBc3AqxJHGyrxAVhA9xqf%2F4IGrAD1bKtymDVdrIXHKsUttchl7JhWGDf7EpblE1Q8S0gM5sJbDMgRhljISPzAj1%2FBaByRBdqdL5Tyd99FSIQ2S%2B%2FbZh2sLMiOl8UT9o7ZGnjkiytCUn14fGWLsUma7OzgJPtnawzkMCdrrVdD42fqH16LgaNMJlMktf0HWmtRKHFYE8HcOPHeyqiLyJUrQofxingPMf4aktAKji87W%2FsMj7en6sL6pRwiiO0m5jB4WPTXYBipwhauy6X01ZpFnLvjNmuthGreyhLTKnnQArUv9ARNDssjTqL60GCVgBEz61TkMLCfhyRPlwMwrpKzkgY6mgG0lc6xaNuPe76g7hNMB1TW6JnPWsYJI880alPBlZdVwLyFPX0dEkCGodAa9scVK1bjLlacX7Kvc28SgCLw%2FfeeVirvM5HfxSppaDlaGFGFjQMPAVi9a5UHWStZ61j1C%2FtZnFFZ0yneJvp%2Bo8JwTj9TfMiYHgdKyS%2BOnBGVCz2ECuqPkTxLw9lFEKtrJkYqUCB12CdX3RPdHXpB&Expires=1649203009"])
        XCTAssert(sut.imageUrlsThumbnails == ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4XBWLE6PR&Signature=vKm%2Bnppsq3XdQ20k4Sg0MdbbokI%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCE1hTraPP2qnlS3zM%2BHxMyvlPN5RYs8MNhMKQrJ0aGVwIge0WYcxyNVHe%2FyAVMAbCXRreBdo2ACQxBV0kmHGHoabkqnQIImP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARADGgwxODQzOTg5NjY4NDEiDD6C%2FqdfBc3AqxJHGyrxAVhA9xqf%2F4IGrAD1bKtymDVdrIXHKsUttchl7JhWGDf7EpblE1Q8S0gM5sJbDMgRhljISPzAj1%2FBaByRBdqdL5Tyd99FSIQ2S%2B%2FbZh2sLMiOl8UT9o7ZGnjkiytCUn14fGWLsUma7OzgJPtnawzkMCdrrVdD42fqH16LgaNMJlMktf0HWmtRKHFYE8HcOPHeyqiLyJUrQofxingPMf4aktAKji87W%2FsMj7en6sL6pRwiiO0m5jB4WPTXYBipwhauy6X01ZpFnLvjNmuthGreyhLTKnnQArUv9ARNDssjTqL60GCVgBEz61TkMLCfhyRPlwMwrpKzkgY6mgG0lc6xaNuPe76g7hNMB1TW6JnPWsYJI880alPBlZdVwLyFPX0dEkCGodAa9scVK1bjLlacX7Kvc28SgCLw%2FfeeVirvM5HfxSppaDlaGFGFjQMPAVi9a5UHWStZ61j1C%2FtZnFFZ0yneJvp%2Bo8JwTj9TfMiYHgdKyS%2BOnBGVCz2ECuqPkTxLw9lFEKtrJkYqUCB12CdX3RPdHXpB&Expires=1649203009"])

    }
    
    
    func test_initialize_withNullData() {
        let JSONloader = MockJSONLoader()
        let model = JSONloader.getAPIModel()!.results![1]
        sut = ProductEntity(productApiModel: model)
        
        XCTAssertNil(sut.price)
        XCTAssertNil(sut.name)
        XCTAssertNil(sut.createdAt)
        XCTAssertNotNil(sut.id)
        XCTAssertNil(sut.imageIDs)
        XCTAssertNil(sut.imageURLs)
        XCTAssertNil(sut.imageUrlsThumbnails)

    }

    

}
