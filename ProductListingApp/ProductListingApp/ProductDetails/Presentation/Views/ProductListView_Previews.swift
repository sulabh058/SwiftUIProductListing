//
//  ProductListView_Previews.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

extension ProductListView_Previews {
    
    static func getViewModel() -> ProductListViewModelMock {
        return ProductListViewModelMock()
    }
    
    class ProductListViewModelMock: ProductListViewModelProtocol {
        
        func shouldShowLoader() -> Bool {isEmpty && isError}
        
        var products: [ProductListItemViewModel] = []
        var isEmpty: Bool { return products.isEmpty }
        var isError: Bool = false
        var error: String = "Error"
        var title: String = "Products"
        func fetchProducts() async {}
    }
}




