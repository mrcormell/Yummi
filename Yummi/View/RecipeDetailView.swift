//
//  RecipeDetailView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 21/02/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(recipe.imageFilepath)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            Text("Rating").bold().padding(.top)
            StarRatingView(rating: recipe.rating)
                .foregroundStyle(Color.orange)
                .padding(.vertical, 5)
            Divider()
            Text("Ingredients").bold()
            ForEach(recipe.ingredients) { ingredient in
                Text(ingredient.simpleDisplay)
            }
            Divider()
            Text("Steps").bold()
            Text("\(recipe.steps)")
            Spacer()
        }
        .padding()
        .navigationTitle(recipe.name)
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: Recipe.example)
    }
}
