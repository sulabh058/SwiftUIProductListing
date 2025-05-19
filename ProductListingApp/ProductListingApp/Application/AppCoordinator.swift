//
//  AppCoordinator.swift
//  ProductListingApp
//
//  Created by Sujith C R on 19/05/25.
//

import SwiftUI

enum AppPages: Hashable {
    case category
    case products
}

class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    lazy private var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: AppConfiguration.baseURL)
        let sessionManager = DefaultNetworkSessionManager(session: SharedURLSession.shared)
        let networkManager = DefaultNetworkManager(config: config, sessionManager: sessionManager)
        return DefaultDataTransferService(networkManager: networkManager)
    }()

    lazy var productCategoriesView: CategoryListView = {
        let categoriesModule = ProductCategoryModule(apiDataTransferService: apiDataTransferService)
        return categoriesModule.generateCategoryListView()
    }()
    
    lazy var productListView: ProductListView = {
        let productsModule = ProductListModule(apiDataTransferService: apiDataTransferService)
        return productsModule.generateProductListView()
    }()


    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
        func build(page: AppPages) -> some View {
            switch page {
            case .category: productCategoriesView
            case .products: productListView
            }
        }


}
