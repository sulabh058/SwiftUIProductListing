//
//  ProductListRepositoryProtocol.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol ProductListRepository {
    func fetchProductList() async throws -> [ProductListItemViewModel]
}
