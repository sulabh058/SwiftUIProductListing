//
//  ProductListService.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol ProductListService {
    func fetchProductListFromNetwork() async throws -> [ProductListItemViewModel]
}

final class DefaultProductListService: ProductListService {
    
    private let apiDataService: DataTransferService
    
    init(apiDataService: DataTransferService) {
        self.apiDataService = apiDataService
    }
    
    func fetchProductListFromNetwork() async throws -> [ProductListItemViewModel] {
        let productListNetworkRequest = DefaultNetworkRequest(path: ProductAPIEndpoint.products,method: .get)
        return try await apiDataService.request(request: productListNetworkRequest)
    }
}
