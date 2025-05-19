//
//  ProductListServiceTests.swift
//  ProductListingAppTests
//
//  Created by Sulabh Surendran on 18/05/25.
//
import XCTest
@testable import ProductListingApp

final class PostServiceTests: XCTestCase {

    var productService: ProductListService!
    var mockDataTransferService: MockDataTransferService!

    override func setUp() {
        super.setUp()
        mockDataTransferService = MockDataTransferService()
        productService = DefaultProductListService(apiDataService: mockDataTransferService)
    }
    
    override func tearDown() {
        productService = nil
        mockDataTransferService = nil
        super.tearDown()
    }
    
    func testProductServiceSuccess() async throws {
        mockDataTransferService.response = MockData.productPage
        let productPage = try await productService.fetchProductListFromNetwork()
        XCTAssertNotNil(productPage)
    }

    func testProductServiceFailure() async throws {
        mockDataTransferService.error = NSError(domain: "FailedError", code: 0)
        do {
            _ = try await productService.fetchProductListFromNetwork()
            XCTFail("Success not expected")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
