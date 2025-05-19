//
//  MockData.swift
//  ProductListingAppTests
//
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation
@testable import ProductListingApp

final class MockData {

    static var mockURL = URL(string: "https://dummyjson.com/products")!
    static var productList: [ProductListItemViewModel] {
        return domainProducts
    }
    
    static var domainProducts: [ProductListItemViewModel] {
        return productPage
    }
    
    static var productPage: [ProductListItemViewModel] {
        let array = [
            ProductListItemViewModel(id: 1, title: "a", price: 1.2, description: "efe", category: "fef", image: "efe", rating: Rating(rate: 1.2, count: 1)),
            ProductListItemViewModel(id: 2, title: "a", price: 1.2, description: "efe", category: "adf", image: "efe", rating: Rating(rate: 1.2, count: 1)),

        ]
        return array
    }
    
    static var productsRawData: Data {
        loadJsonData("Products")
    }
    
    private static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
