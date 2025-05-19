//
//  HeaderImageView.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import SwiftUI
struct CategoryHeaderImageView: View {
    
    let urlString: String
    let height: CGFloat
    
    var body: some View {
        AsyncImage(
            url: URL(string: urlString),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 100)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}
