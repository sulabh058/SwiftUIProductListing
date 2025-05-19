//
//  ProductItemViewModel.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

// MARK: - Product Model

struct ProductListItemViewModel: Codable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    // Conforming to Hashable by using the id
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Rating Model
struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}
