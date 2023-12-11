//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct Ingredient {
    let name: String
    var measurement: Measurement<Dimension>
    let category: IngredientCategory
    let expiry: Date
    
    var expiryDateDisplay: String {
        "\(expiry.formatted(date: .long, time: .omitted))"
    }
    
    var display: String {
        "\(measurement.description) of \(name) (\(category.rawValue)) which expires on \(expiryDateDisplay)"
    }
}

enum Unit: String {
    case grams, millileters, tsp, tbsp, cup
}

enum IngredientCategory: String {
    case meat, fish, dairy, fruit, vegetable, cupboard
}

struct ContentView: View {
    let myIngredient: Ingredient = Ingredient(name: "Minced Beef", measurement: Measurement(value: 600, unit: UnitMass.grams), category: .meat, expiry: Date.now.addingTimeInterval(86400))
    
    var body: some View {
        Text(myIngredient.display)
    }
}

#Preview {
    ContentView()
}
