//
//  IngredientsViewModel.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 12/03/2024.
//

import Foundation

@Observable
class IngredientsViewModel {
    
    // only ever one shared view model object allowed
    static let shared = IngredientsViewModel()

    var myIngredients: [Ingredient] = [Ingredient(name: "Minced Beef", quantity: 1, unit: "Kg", category: "Meat", expiry: Date.now),Ingredient(name: "Minced Pork", quantity: 1, unit: "Kg", category: "Meat", expiry: Date.now)]
    
    var newIngredientName = ""
    var newIngredientQuantity = 1
    var newIngredientUnit = "g"
    var newIngredientCategory = "Meat"
    var newIngredientExpiry = Date.now
    var showingAddNewIngredient = false

    // ensures object can only be initialised internally
    private init() {}
    
    func addNewIngredient() {
        myIngredients.append(Ingredient(name: newIngredientName, quantity: newIngredientQuantity, unit: newIngredientUnit, category: newIngredientCategory, expiry: newIngredientExpiry))
        newIngredientName = ""
        newIngredientQuantity = 1
        newIngredientExpiry = Date.now
        showingAddNewIngredient = false
    }

}

