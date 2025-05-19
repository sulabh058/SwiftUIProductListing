//
//  ProductItem.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import SwiftUI

struct ProductItemView: View {
    
    var item: ProductListItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                ProductHeaderImageView(urlString: item.image, height: 200)
                Text(item.title).font(.title)
            }
            Text("$\(item.price, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.green)
            Text(item.description).font(.title2)
            HStack {
                Image(systemName: "star.fill").foregroundStyle(.yellow)
                Text("\(item.rating.rate, specifier: "%.1f"), \(item.rating.count) views")
                    .font(.title2)
            }
        }
        .preferredColorScheme(.light)
    }
}
