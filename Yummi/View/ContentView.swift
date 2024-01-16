//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    let myIngredient: Ingredient = Ingredient(name: "Minced Beef", quantity: 1, unit: "Kg", category: "Meat", expiry: "21st February 2024")
    
    var body: some View {
        Text(myIngredient.display())
    }
}

#Preview {
    ContentView()
}
