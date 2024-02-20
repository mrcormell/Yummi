//
//  Ingredient.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 16/01/2024.
//

import Foundation

struct Ingredient {
    let name: String
    var quantity: Int
    let unit: String
    let category: String
    let expiry: Date
    
    var expiryDateDisplay: String {
        "\(expiry.formatted(date: .long, time: .omitted))"
    }
    
    var display: String {
        "\(quantity)\(unit) of \(name) (\(category)) which expires on \(expiryDateDisplay)"
    }
}
