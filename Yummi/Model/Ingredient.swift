//
//  Ingredient.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 16/01/2024.
//

import Foundation

struct Ingredient: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    var measurement: Measurement<Dimension>
    let category: IngredientCategory
    let expiry: Date
    
    var expiryDateDisplay: String {
        "\(expiry.formatted(date: .long, time: .omitted))"
    }
    
    var measurementDisplayImperial: String {
        "\(measurement.converted(to: UnitVolume.cups).description)"
    }
    
    var simpleDisplay: String {
        "\(measurement.description) of \(name)"
    }
    
    var display: String {
        "\(simpleDisplay) (\(category.rawValue)) which expires on \(expiryDateDisplay)"
    }
    
    var displayImperial: String {
        "\(measurementDisplayImperial) of \(name) (\(category.rawValue)) which expires on \(expiryDateDisplay)"
    }
}

enum Unit: String {
    case grams, millileters, tsp, tbsp, cup
}

enum IngredientCategory: String, CaseIterable {
    case meat, fish, dairy, fruit, vegetable, cupboard
}
