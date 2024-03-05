//
//  IngredientsViewModel.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/02/2024.
//

import Foundation

@Observable
class IngredientsViewModel {
    static let shared = IngredientsViewModel()
    var ingredients: [InventoryIngredient] = InventoryIngredient.examples.sorted(by: { $0.expiry < $1.expiry })

    private init() {}
    
    func add(ingredient: InventoryIngredient) {
        ingredients.append(ingredient)
        ingredients.sort(by: { $0.expiry < $1.expiry })
    }
    
}
