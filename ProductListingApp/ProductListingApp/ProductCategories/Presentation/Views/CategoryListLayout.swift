//
//  CategoryListLayout.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import SwiftUI

struct CategoryListLayout: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    let items: [String]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                NavigationLink(value: item) {
                    CategoryItemView(item: item)
                }
            }
        }
        .preferredColorScheme(.light)
    }
}
