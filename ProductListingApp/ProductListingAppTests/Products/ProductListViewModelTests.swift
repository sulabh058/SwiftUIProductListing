//
//  ProductListViewModelTests.swift
//  ProductListingAppTests
//
//  Created by Sulabh Surendran on 18/05/25.
//

import XCTest
@testable import ProductListingApp

final class ProductListViewModelTest: XCTestCase {
    
    var productListViewModel: ProductListViewModel!
    var mockProductUseCase: MockProductListUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        mockProductUseCase = MockProductListUseCase()
        productListViewModel = ProductListViewModel(useCase: mockProductUseCase)
    }
    
    override func tearDown() {
        super.tearDown()
        productListViewModel = nil
        mockProductUseCase = nil
    }

    func testProductListViewModelSuccess() async throws {
        XCTAssertTrue(productListViewModel.shouldShowLoader())
        mockProductUseCase.response = MockData.productList
        await productListViewModel.fetchProducts()
        XCTAssertFalse(productListViewModel.shouldShowLoader())
    }
    
    func testProductListViewModelFailure() async throws {
        mockProductUseCase.error = NetworkError.failed
        await productListViewModel.fetchProducts()
        XCTAssertTrue(productListViewModel.products.count == 0)
        XCTAssertNotNil(productListViewModel.error)
        XCTAssertEqual(productListViewModel.error, NetworkError.failed.description)
        XCTAssertTrue(productListViewModel.isError)
    }
}
