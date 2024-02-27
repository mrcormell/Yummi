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
    let steps: String
    let numberServes: Int
    var isFavourite: Bool
    var rating: Int
    let imageFilepath: String
    
    #if DEBUG
    static var examples: [Recipe] {
        [Recipe(name:"Prawn Fried Rice", ingredients: [Ingredient(name: "Prawn", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .fish),Ingredient(name: "Rice", measurement: Measurement(value: 2, unit: UnitVolume.cups), category: .cupboard)], steps: "Make Prawn Fried Rice in a Wok!", numberServes: 4,isFavourite: false, rating: 5, imageFilepath: "prawnFriedRice"),
         Recipe(name:"Bacon Sandwich", ingredients: [Ingredient(name: "Bacon", measurement: Measurement(value: 200, unit: UnitMass.grams), category: .meat),Ingredient(name: "Bread", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .cupboard)], steps: "Fry Bacon and Place on Bread", numberServes: 1,isFavourite: true, rating: 2, imageFilepath: "baconSandwich"),
         Recipe(name:"Brie Sandwich", ingredients: [Ingredient(name: "Brie", measurement: Measurement(value: 150, unit: UnitMass.grams), category: .dairy),Ingredient(name: "Bread", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .cupboard)], steps: "Slice Brie and Place on Bread", numberServes: 1,isFavourite: false, rating: 4, imageFilepath: "brieSandwich"),
         Recipe(name:"Tomato Sandwich", ingredients: [Ingredient(name: "Tomato", measurement: Measurement(value: 50, unit: UnitMass.grams), category: .vegetable),Ingredient(name: "Bread", measurement: Measurement(value: 100, unit: UnitMass.grams), category: .cupboard)], steps: "Slice Tomato and Place on Bread", numberServes: 1,isFavourite: true, rating: 2, imageFilepath: "tomatoSandwich"),
         
         ]
    }
    
    static var example: Recipe {
        Recipe.examples[0]
    }
    #endif
}
