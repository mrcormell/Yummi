//
//  RecipeListItemView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 21/02/2024.
//

import SwiftUI

struct RecipeListItemView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            Image(recipe.imageFilepath)
                .resizable()
                .scaledToFill()
                .frame(width: 60,height: 70)
                .clipped()
            VStack(alignment: .leading) {
                Text(recipe.name)
                Text("Serves \(recipe.numberServes)")
                    .font(.caption)
                    .padding(.bottom, 5)
                StarRatingView(rating: recipe.rating)
                    .font(.caption)
                    .foregroundStyle(Color.yellow)
            }
            Spacer()
            Image(systemName: "\(recipe.ingredients.count).circle")
            if recipe.isFavourite {
                Image(systemName: "star.fill")
            } else {
                Image(systemName: "star")
            }
        }
    }
}

#Preview {
    RecipeListItemView(recipe: Recipe.example)
}
