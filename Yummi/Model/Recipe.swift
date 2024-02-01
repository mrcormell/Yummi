//
//  Recipe.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import Foundation

struct Recipe {
    let name: String
    let ingredients: [Ingredient]
    var isFavourite: Bool
    var rating: Int
    let imageFilepath: String
    
    #if DEBUG
    static var examples: [Recipe] {
        [Recipe(name:"Prawn Fried Rice", ingredients: [Ingredient(name: "Prawn", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .fish, expiry: Date.now.addingTimeInterval(8640000)),Ingredient(name: "Rice", measurement: Measurement(value: 2, unit: UnitVolume.cups), category: .cupboard, expiry: Date.now.addingTimeInterval(8640000))],isFavourite: false, rating: 5, imageFilepath: "prawnFriedRice"),
         Recipe(name:"Bacon Sandwich", ingredients: [Ingredient(name: "Bacon", measurement: Measurement(value: 200, unit: UnitMass.grams), category: .meat, expiry: Date.now.addingTimeInterval(8640000)),Ingredient(name: "Bread", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .cupboard, expiry: Date.now.addingTimeInterval(8640000))],isFavourite: true, rating: 2, imageFilepath: "baconSandwich"),
         Recipe(name:"Brie Sandwich", ingredients: [Ingredient(name: "Brie", measurement: Measurement(value: 150, unit: UnitMass.grams), category: .dairy, expiry: Date.now.addingTimeInterval(8640000)),Ingredient(name: "Bread", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .cupboard, expiry: Date.now.addingTimeInterval(8640000))],isFavourite: false, rating: 4, imageFilepath: "brieSandwich"),
         Recipe(name:"Tomato Sandwich", ingredients: [Ingredient(name: "Tomato", measurement: Measurement(value: 50, unit: UnitMass.grams), category: .vegetable, expiry: Date.now.addingTimeInterval(8640000)),Ingredient(name: "Bread", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .cupboard, expiry: Date.now.addingTimeInterval(8640000))],isFavourite: true, rating: 2, imageFilepath: "tomatoSandwich"),
         
         ]
    }
    #endif
}
