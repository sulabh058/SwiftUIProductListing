//
//  ProductCategoryUseCase.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol ProductCategoryUseCase {
    func fetchProductCategories() async throws -> [String]
}

final class DefaultCategoryListUseCase: ProductCategoryUseCase {
    
    private let repository: ProductCategoryRepository
    
    init(repository: ProductCategoryRepository) {
        self.repository = repository
    }
    
    func fetchProductCategories() async throws -> [String] {
        try await repository.fetchProductCategories()
    }
}
