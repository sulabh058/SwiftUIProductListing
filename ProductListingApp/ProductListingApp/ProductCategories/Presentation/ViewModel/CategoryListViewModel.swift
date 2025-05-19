//
//  CategoryListViewModel.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol CategoryListViewModelProtocol: ObservableObject {
    var products: [SelectedItem] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    var title: String {get}
    func shouldShowLoader() -> Bool
    func fetchCategories() async
}

struct SelectedItem: Hashable {
    let id = UUID()
    let name: String
}

final class CategoryListViewModel: CategoryListViewModelProtocol {
    
    @Published var products: [SelectedItem] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return products.isEmpty }
    var title: String = AppConfiguration.productPath
    private let productCategoryUseCase: ProductCategoryUseCase!
    init(useCase: ProductCategoryUseCase) {
        self.productCategoryUseCase = useCase
    }
    
    /// This method fetches products and catches error if any
    @MainActor func fetchCategories() async {
        do {
            let productCategories = try await productCategoryUseCase.fetchProductCategories()
            self.products = productCategories.map { category in
                SelectedItem(name: category)
            }
            self.isError = false
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }
        
    /// This method checks if the loader should be shown or not
    /// - Returns: True if there the product array is empty and error is not there
    func shouldShowLoader() -> Bool {
        return (isEmpty && !isError)
    }
}
