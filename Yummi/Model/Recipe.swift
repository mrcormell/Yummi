//
//  Recipe.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import Foundation

struct Recipe: Identifiable {
    var id: UUID = UUID()
    
    let name: String
    let ingredients: [Ingredient]
    var isFavourite: Bool
    var rating: Int
    
    #if DEBUG
    static var examples: [Recipe] {
        [Recipe(name:"Prawn Fried Rice", ingredients: [Ingredient(name: "Prawns", quantity: 12, unit: "units", category: "Fish", expiry: Date.now),Ingredient(name: "Rice", quantity: 200, unit: "g", category: "Cupboard", expiry: Date.now)],isFavourite: true, rating: 5),
         Recipe(name:"Bacon Sandwich", ingredients: [Ingredient(name: "Bacon", quantity: 4, unit: "units", category: "Meat", expiry: Date.now),Ingredient(name: "Bread", quantity: 2, unit: "units", category: "Cupboard", expiry: Date.now)],isFavourite: false, rating: 2),
         Recipe(name:"Brie Sandwich", ingredients: [Ingredient(name: "Brie", quantity: 200, unit: "g", category: "Dairy", expiry: Date.now),Ingredient(name: "Bread", quantity: 2, unit: "units", category: "Cupboard", expiry: Date.now)],isFavourite: false, rating: 2),
         Recipe(name:"Tomato Sandwich", ingredients: [Ingredient(name: "Tomato", quantity: 1, unit: "units", category: "Fruit / Vegetable", expiry: Date.now),Ingredient(name: "Bread", quantity: 2, unit: "units", category: "Cupboard", expiry: Date.now)],isFavourite: false, rating: 2),
         Recipe(name:"Tomato Sandwich", ingredients: [Ingredient(name: "Tomato", quantity: 1, unit: "units", category: "Fruit / Vegetable", expiry: Date.now),Ingredient(name: "Bread", quantity: 2, unit: "units", category: "Cupboard", expiry: Date.now)],isFavourite: true, rating: 4)]
    }
    #endif
}
