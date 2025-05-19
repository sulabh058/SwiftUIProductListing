//
//  ProductCategoryModule.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation

final class ProductCategoryModule {

    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    func generateCategoryListView() -> CategoryListView<CategoryListViewModel> {
        CategoryListView(viewModel: generateCategoryListViewModel())
    }
    
    private func generateCategoryListViewModel() -> CategoryListViewModel {
        CategoryListViewModel(useCase: generateCategoryListUseCase())
    }
    
    private func generateCategoryListUseCase() -> ProductCategoryUseCase {
        DefaultCategoryListUseCase(repository: generateCategoryListRepository())
    }
    
    private func generateCategoryListRepository() -> ProductCategoryRepository {
        DefaultCategoryListRepository(service: generateCategoryListService())
    }
    
    private func generateCategoryListService() -> CategoryListService {
        DefaultCategoryListService(apiDataService: apiDataTransferService)
    }
}
