//
//  ProductDataListDTO.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation
struct ProductPageDataListDTO: Decodable {
    let products: [ProductDataListDTO]
}


struct ProductDataListDTO: Decodable {
    let productId: Int
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let category: String?
    let thumbnail: String?
    let images: [String]?
    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case title
        case description
        case price
        case discountPercentage
        case category
        case thumbnail
        case images
    }
}

extension ProductDataListDTO {
    
    func toDomain() -> ProductListDTO {
        .init(productId: productId,
              title: title ?? "",
              description: description ?? "",
              price: price ?? 0,
              category: category ?? "",
              thumbnail: thumbnail ?? "",
              rating: Rating(rate: 2.1, count: 123)
        )
    }
}
