//
//  CategoryListView_Previews.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

extension CategoryListView_Previews {
    
    static func getViewModel() -> CategoryListViewModelMock {
        return CategoryListViewModelMock()
    }
    
    class CategoryListViewModelMock: CategoryListViewModelProtocol {
        
        func shouldShowLoader() -> Bool {isEmpty && isError}
        
        var products: [SelectedItem] = [SelectedItem(name: "efe")]
        var isEmpty: Bool { return products.isEmpty }
        var isError: Bool = false
        var error: String = "Error"
        var title: String = "Products"
        func fetchCategories() async {}
    }
}




