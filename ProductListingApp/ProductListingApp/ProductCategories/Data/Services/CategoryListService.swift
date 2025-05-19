//
//  CategoryListService.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol CategoryListService {
    func fetchCategoryListFromNetwork() async throws -> [String]
}

final class DefaultCategoryListService: CategoryListService {
    
    private let apiDataService: DataTransferService
    
    init(apiDataService: DataTransferService) {
        self.apiDataService = apiDataService
    }
    
    func fetchCategoryListFromNetwork() async throws -> [String] {
        let productListNetworkRequest = DefaultNetworkRequest(path: APIEndpoint.products,method: .get)
        return try await apiDataService.request(request: productListNetworkRequest)
    }
}
