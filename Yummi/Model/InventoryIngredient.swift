//
//  InventoryIngredient.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/02/2024.
//

import Foundation

struct InventoryIngredient: Identifiable {
    let ingredient: Ingredient
    let expiry: Date
    
    var id: UUID {
        ingredient.id
    }
    
    var expiryDateDisplay: String {
        "\(expiry.formatted(date: .long, time: .omitted))"
    }
    
    var display: String {
        "\(ingredient.display) which expires on \(expiryDateDisplay)"
    }
    
    #if DEBUG
    static var examples: [InventoryIngredient] {
        [InventoryIngredient(ingredient: Ingredient(name: "Minced Beef", measurement: Measurement(value: 600, unit: UnitMass.grams), category: .meat), expiry: Date.now.addingTimeInterval(86400)),
                                  InventoryIngredient(ingredient: Ingredient(name: "Whole Milk", measurement: Measurement(value: 500, unit: UnitVolume.liters), category: .dairy), expiry: Date.now),
                                  InventoryIngredient(ingredient: Ingredient(name: "Spirali Pasta", measurement: Measurement(value: 1, unit: UnitMass.kilograms), category: .cupboard), expiry: Date.now.addingTimeInterval(8640000)),
                                  InventoryIngredient(ingredient:Ingredient(name: "Greek Yoghurt", measurement: Measurement(value: 250, unit: UnitVolume.milliliters), category: .dairy), expiry: Date.now.addingTimeInterval(86400))]
    }
    #endif
}
