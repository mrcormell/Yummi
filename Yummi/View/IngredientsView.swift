//
//  IngredientsView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 20/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    @State private var myIngredients: [Ingredient] = [Ingredient(name: "Minced Beef", quantity: 1, unit: "Kg", category: "Meat", expiry: Date.now),Ingredient(name: "Minced Pork", quantity: 1, unit: "Kg", category: "Meat", expiry: Date.now)]
    
    @State private var currentIngredientIndex = 0
    @State private var newIngredientName = ""
    @State private var newIngredientQuantity = 1
    @State private var newIngredientUnit = "g"
    @State private var newIngredientCategory = "Meat"
    @State private var newIngredientExpiry = Date.now
    
    var body: some View {
        Form {
            Section {
                Text(myIngredients[currentIngredientIndex].display)
                Button("Next") {
                    if currentIngredientIndex >= myIngredients.count - 1 {
                        currentIngredientIndex = 0
                    } else {
                        currentIngredientIndex += 1
                    }
                }
            }
            Section(content: {
                TextField("Name", text: $newIngredientName)
                Picker("Category", selection: $newIngredientCategory) {
                    Text("Meat").tag("Meat")
                    Text("Fish").tag("Fish")
                    Text("Dairy").tag("Dairy")
                    Text("Cupboard").tag("Cupboard")
                    Text("Fruit / Vegetable").tag("Fruit / Vegetable")
                }
                Picker("Unit", selection: $newIngredientUnit) {
                    Text("g").tag("g")
                    Text("ml").tag("ml")
                    Text("units").tag("units")
                }
                Stepper("\(newIngredientQuantity) \(newIngredientUnit)", value: $newIngredientQuantity)
                DatePicker("Expiry Date", selection: $newIngredientExpiry, displayedComponents: .date)
                Button("Add") {
                    myIngredients.append(Ingredient(name: newIngredientName, quantity: newIngredientQuantity, unit: newIngredientUnit, category: newIngredientCategory, expiry: newIngredientExpiry))
                    newIngredientName = ""
                    newIngredientQuantity = 1
                    newIngredientExpiry = Date.now
                    currentIngredientIndex = myIngredients.count - 1
                }
            }, header: { Text("Add a new ingredient")})
        }
    }
}

#Preview {
    IngredientsView()
}
