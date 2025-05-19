//
//  ProductListRepository.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

final class DefaultProductListRepository: ProductListRepository {
    
    private let service: ProductListService
    
    init(service: ProductListService) {
        self.service = service
    }
    
    func fetchProductList() async throws -> [ProductListItemViewModel] {
        try await service.fetchProductListFromNetwork().map { $0 }
    }
}
