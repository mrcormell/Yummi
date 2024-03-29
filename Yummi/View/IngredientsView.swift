//
//  IngredientsView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 21/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    @State var ingredients = [InventoryIngredient(ingredient: Ingredient(name: "Minced Beef", measurement: Measurement(value: 600, unit: UnitMass.grams), category: .meat), expiry: Date.now.addingTimeInterval(86400)),
                              InventoryIngredient(ingredient: Ingredient(name: "Whole Milk", measurement: Measurement(value: 500, unit: UnitVolume.liters), category: .dairy), expiry: Date.now),
                              InventoryIngredient(ingredient: Ingredient(name: "Spirali Pasta", measurement: Measurement(value: 1, unit: UnitMass.kilograms), category: .cupboard), expiry: Date.now.addingTimeInterval(8640000)),
                              InventoryIngredient(ingredient:Ingredient(name: "Greek Yoghurt", measurement: Measurement(value: 250, unit: UnitVolume.milliliters), category: .dairy), expiry: Date.now.addingTimeInterval(86400))].sorted(by: { $0.expiry < $1.expiry })
    
    @State var enteredIngredientName = ""
    @State var selectedCategory = IngredientCategory.cupboard
    @State var selectedExpiryDate: Date = Date.now
    @State var quantity: Int = 1
    @State var selectedUnit: Dimension = UnitMass.kilograms
    
    var body: some View {
        Form {
            Section {
                List($ingredients, id: \.id, editActions: .delete) { $ingredient in
                        Text(ingredient.display)
                }
            }
            Section(content: {
                TextField("Name", text: $enteredIngredientName)
                Picker("Unit", selection: $selectedUnit) {
                    ForEach([UnitMass.kilograms, UnitMass.grams, UnitVolume.liters], id: \.self) {
                        Text($0.symbol)
                    }
                }
                Stepper("\(quantity) \(selectedUnit.symbol)", value: $quantity)
                Picker("Category", selection: $selectedCategory) {
                    ForEach(IngredientCategory.allCases, id:\.self) {
                        Text($0.rawValue)
                    }
                }
                DatePicker("Expiry Date", selection: $selectedExpiryDate, in: Date.now..., displayedComponents: .date)
                Button("Add") {
                    ingredients.append(InventoryIngredient(ingredient: Ingredient(name: enteredIngredientName, measurement: Measurement(value: Double(quantity), unit: selectedUnit), category: selectedCategory), expiry: selectedExpiryDate))
                    ingredients.sort(by: { $0.expiry < $1.expiry })
                }
            }, header: { Text("Add new ingredient")}
            )
        }
    }
}

#Preview {
    IngredientsView()
}
