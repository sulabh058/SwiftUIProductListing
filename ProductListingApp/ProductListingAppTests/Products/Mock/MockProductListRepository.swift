//
//  MockProductListRepository.swift
//  ProductListingAppTests
//
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation
@testable import ProductListingApp

final class MockProductListRepository: ProductListRepository {

    var response: [ProductListItemViewModel] = [ProductListItemViewModel(id: 2, title: "a", price: 1.2, description: "efe", category: "adf", image: "efe", rating: Rating(rate: 1.2, count: 1))]
    var error: Error?

    func fetchProductList() async throws -> [ProductListItemViewModel] {
        if let error {
            throw error
        }
        return response
    }
}
