//
//  RecipesViewModel.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/02/2024.
//

import Foundation

@Observable
class RecipesViewModel {
    private let ingredientsViewModel = IngredientsViewModel.shared
    
    var recipes: [Recipe] = Recipe.examples
    var searchText = ""
    var onlyShowRecipesThatYouHaveIngredientsFor: Bool = false
    
    var sortedByRatingRecipes: [Recipe] {
        if searchText.isEmpty {
            return recipes.sorted(by: { $0.rating > $1.rating })
        } else {
            return recipes.filter { $0.name.contains(searchText) }
                .sorted(by: { $0.rating > $1.rating })
        }
        
    }
    
    func recipesCanMake() -> [Recipe] {
        return recipes.filter({
            for ingredient in $0.ingredients {
                if !(ingredientsViewModel.ingredients.map({$0.ingredient}).contains(where: { ingredientInPantry in
                    ingredientInPantry.name == ingredient.name
                })) {
                    return false
                }
            }
            return true
        })
    }
}
