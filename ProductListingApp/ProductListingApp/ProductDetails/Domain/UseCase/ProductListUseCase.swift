//
//  ProductListUseCase.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol ProductListUseCase {
    func fetchProductList() async throws -> [ProductListItemViewModel]
}

final class DefaultProductListUseCase: ProductListUseCase {
    
    private let repository: ProductListRepository
    
    init(repository: ProductListRepository) {
        self.repository = repository
    }
    
    func fetchProductList() async throws -> [ProductListItemViewModel] {
        try await repository.fetchProductList()
    }
}
