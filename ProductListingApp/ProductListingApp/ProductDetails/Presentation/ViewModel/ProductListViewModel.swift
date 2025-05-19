//
//  ProductListViewModel.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

protocol ProductListViewModelProtocol: ObservableObject {
    var products: [ProductListItemViewModel] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    var title: String {get}
    func shouldShowLoader() -> Bool
    func fetchProducts() async
}

final class ProductListViewModel: ProductListViewModelProtocol {
    
    @Published var products: [ProductListItemViewModel] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return products.isEmpty }
    var title: String = AppConfiguration.productPath
    private let productListUseCase: ProductListUseCase!
    init(useCase: ProductListUseCase) {
        self.productListUseCase = useCase
    }
    
    /// This method fetches products and catches error if any
    @MainActor func fetchProducts() async {
        do {
            let productList = try await productListUseCase.fetchProductList()
            self.products = productList
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
    
    /// This method maps Product to ProductListItemViewModel
    /// - Parameter products:array of Product
    /// - Returns: array of ProductListItemViewModel
    private func transformFetchedProducts(products: [ProductListDTO]) -> [ProductListItemViewModel] {
        products.map { ProductListItemViewModel(id: $0.productId,
                                                title: $0.title,
                                                price: $0.price,
                                                description: $0.description,
                                                category: $0.category.capitalized,
                                                image: $0.thumbnail,
                                                rating: $0.rating
        )
        }
    }
    
    /// This method checks if the loader should be shown or not
    /// - Returns: True if there the product array is empty and error is not there
    func shouldShowLoader() -> Bool {
        return (isEmpty && !isError)
    }
}
