//
//  RecipesView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import SwiftUI

struct RecipesView: View {
    @State private var recipesViewModel = RecipesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipesViewModel.sortedByRatingRecipes, id: \.name) { recipe in
                    NavigationLink(destination: {
                        RecipeDetailView(recipe: recipe)
                    }, label: {
                        RecipeListItemView(recipe: recipe)
                    })
                    
                }
            }
            .navigationTitle("Recipes")
            .searchable(text: $recipesViewModel.searchText)
        }
    }
}

#Preview {
    RecipesView()
}
