//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    let myIngredients: [Ingredient] = [Ingredient(name: "Minced Beef", quantity: 1, unit: "Kg", category: "Meat", expiry: "21st February 2024"),Ingredient(name: "Minced Pork", quantity: 1, unit: "Kg", category: "Meat", expiry: "21st February 2024")]
    @State private var currentIngredientIndex = 0
    
    var body: some View {
        Form {
            Section {
                Text(myIngredients[currentIngredientIndex].display())
                Button("Next") {
                    if currentIngredientIndex >= myIngredients.count - 1 {
                        currentIngredientIndex = 0
                    } else {
                        currentIngredientIndex += 1
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
