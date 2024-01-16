//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct Ingredient {
    let name: String
    var quantity: Int
    let unit: String
    let category: String
    let expiry: Date
    
    func display() -> String {
        return "\(quantity)\(unit) of \(name) (\(category)) which expires on \(expiry.description)"
    }
}

struct ContentView: View {
    let myIngredient: Ingredient = Ingredient(name: "Minced Beef", quantity: 1, unit: "Kg", category: "Meat", expiry: Date.now)
    
    var body: some View {
        Text(myIngredient.display())
    }
}

#Preview {
    ContentView()
}
