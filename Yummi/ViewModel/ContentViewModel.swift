//
//  ContentViewModel.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/02/2024.
//

import Foundation

@Observable
class ContentViewModel {
    var isShowingRecipesView = false
    let ingredientsViewModel = IngredientsViewModel.shared
    let recipesViewModel = RecipesViewModel()
    
    func recipesCanMake() -> [Recipe] {
        return recipesViewModel.recipes.filter({
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
