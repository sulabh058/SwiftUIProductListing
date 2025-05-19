//
//  ProductDetailsView.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import SwiftUI

struct ProductDetailsView: View {
    
    let item: ProductListItemViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ProductHeaderImageView(urlString: item.image, height: 300)
                Text(item.title)
                    .font(.title)
                Text(item.description)
                    .font(.title3)
            }
            .padding(10)
            .navigationTitle(item.category)
            .navigationBarTitleDisplayMode(.inline)
        }.preferredColorScheme(.light)
    }
}
