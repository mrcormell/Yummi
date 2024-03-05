//
//  RecipesView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import SwiftUI

struct RecipesView: View {
    @State var recipesViewModel: RecipesViewModel = RecipesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Toggle("With My Ingredients", isOn: $recipesViewModel.onlyShowRecipesThatYouHaveIngredientsFor)
                ForEach(recipesViewModel.onlyShowRecipesThatYouHaveIngredientsFor ? recipesViewModel.recipesCanMake() : recipesViewModel.sortedByRatingRecipes, id: \.name) { recipe in
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
