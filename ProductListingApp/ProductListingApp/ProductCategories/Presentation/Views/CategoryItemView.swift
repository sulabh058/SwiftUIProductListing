//
//  CategoryItem.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import SwiftUI

struct CategoryItemView: View {
    
    var item: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item).font(.title)
        }
        .preferredColorScheme(.light)
    }
}
