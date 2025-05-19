//
//  CategoryListRepository.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

final class DefaultCategoryListRepository: ProductCategoryRepository {
    
    private let service: CategoryListService
    
    init(service: CategoryListService) {
        self.service = service
    }
    
    func fetchProductCategories() async throws -> [String] {
        try await service.fetchCategoryListFromNetwork().map { $0 }
    }
}
