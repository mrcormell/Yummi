//
//  StarRatingView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 21/02/2024.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Int
    let maximumRating = 5
    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                if number > rating {
                    offImage
                    
                } else {
                    onImage
                }
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 3)
}
