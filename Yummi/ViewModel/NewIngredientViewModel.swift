//
//  NewIngredientViewModel.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/02/2024.
//

import Foundation

@Observable 
class NewIngredientViewModel {    
    static let shared = NewIngredientViewModel()
    
    var enteredIngredientName = ""
    var selectedCategory = IngredientCategory.cupboard
    var selectedExpiryDate: Date = Date.now
    var quantity: Int = 1
    var selectedUnit: Dimension = UnitMass.kilograms
    
    private init() {}
    
    func addNewIngredient() {
        let newIngredient = InventoryIngredient(ingredient: Ingredient(name: enteredIngredientName, measurement: Measurement(value: Double(quantity), unit: selectedUnit), category: selectedCategory), expiry: selectedExpiryDate)
        IngredientsViewModel.shared.add(ingredient: newIngredient)
    }

}
