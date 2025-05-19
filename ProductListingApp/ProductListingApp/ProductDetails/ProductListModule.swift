//
//  ProductListModule.swift
//  ProductListingApp
//
//  Created by Sujith C R on 18/05/25.
//

import Foundation

final class ProductListModule {

    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    func generateProductListView() -> ProductListView<ProductListViewModel> {
        ProductListView(viewModel: generateProductListViewModel())
    }
    
    private func generateProductListViewModel() -> ProductListViewModel {
        ProductListViewModel(useCase: generateProductListUseCase())
    }
    
    private func generateProductListUseCase() -> ProductListUseCase {
        DefaultProductListUseCase(repository: generateProductListRepository())
    }
    
    private func generateProductListRepository() -> ProductListRepository {
        DefaultProductListRepository(service: generateProductListService())
    }
    
    private func generateProductListService() -> ProductListService {
        DefaultProductListService(apiDataService: apiDataTransferService)
    }
}
