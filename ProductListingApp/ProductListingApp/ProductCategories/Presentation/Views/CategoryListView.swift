//
//  CategoryListView.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import SwiftUI

struct CategoryListView<ViewModel>: View where ViewModel: CategoryListViewModelProtocol {
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                List {
                    ForEach(viewModel.products, id: \.id) { item in
                        NavigationLink(value: item) {
                            CategoryItemView(item: item.name)
                        }
                    }
                }
                .navigationDestination(for: SelectedItem.self) { text in
                    
                    coordinator.productListView
                }
                .overlay {
                    if viewModel.isError {
                    }
                }
                .navigationTitle(viewModel.title)
            }
        }
        .task {
            await fetchCategories()
        }
    }
    
    private func fetchCategories() async {
        await viewModel.fetchCategories()
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(viewModel: CategoryListView_Previews.getViewModel())
    }
}
