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
            Text("Rating: \(recipe.rating)/5")
            Divider()
            ForEach(recipe.ingredients) { ingredient in
                Text(ingredient.simpleDisplay)
            }
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
