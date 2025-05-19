//
//  ProductCategoryRepositoryProtocol.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol ProductCategoryRepository {
    func fetchProductCategories() async throws -> [String]
}
