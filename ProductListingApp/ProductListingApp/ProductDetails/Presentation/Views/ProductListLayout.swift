//
//  ProductListLayout.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import SwiftUI

struct ProductListLayout: View {
    
    let items: [ProductListItemViewModel]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(items, id: \.self) { item in
                ProductItemView(item: item)
                Divider()
            }
        }
        .preferredColorScheme(.light)
    }
}
