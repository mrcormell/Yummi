//
//  RecipesView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import SwiftUI

struct RecipesView: View {
    var recipes: [Recipe] = Recipe.examples
    
    var sortedByRatingRecipes: [Recipe] {
        if searchText.isEmpty {
            return recipes.sorted(by: { $0.rating > $1.rating })
        } else {
            return recipes.filter { $0.name.contains(searchText) }
                .sorted(by: { $0.rating > $1.rating })
        }
        
    }
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sortedByRatingRecipes, id: \.name) { recipe in
                    NavigationLink(destination: {
                        RecipeDetailView(recipe: recipe)
                    }, label: {
                        RecipeListItemView(recipe: recipe)
                    })
                    
                }
            }
            .navigationTitle("Recipes")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    RecipesView()
}
