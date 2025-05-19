//
//  ProductListDTO.swift
//  ProductListingApp
//
//  Created by Sujith C R on 19/05/25.
//

import Foundation

struct ProductListDTO {
    let productId: Int
    let title: String
    let description: String
    let price: Double
    var category: String
    let thumbnail: String
    let rating: Rating
}
