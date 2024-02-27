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
}
