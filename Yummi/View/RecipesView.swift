//
//  RecipesView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import SwiftUI

struct RecipesView: View {
    var recipes: [Recipe] = Recipe.examples
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.name) {
                        RecipeDetailView(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipesView()
}
