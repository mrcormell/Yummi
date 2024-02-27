//
//  IngredientsView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 21/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    @State private var newIngredientViewModel = NewIngredientViewModel.shared
    @State private var ingredientsViewModel = IngredientsViewModel.shared
    
    var body: some View {
        Form {
            Section {
                List($ingredientsViewModel.ingredients, id: \.id, editActions: .delete) { $ingredient in
                        Text(ingredient.display)
                }
            }
            Section(content: {
                TextField("Name", text: $newIngredientViewModel.enteredIngredientName)
                Picker("Unit", selection: $newIngredientViewModel.selectedUnit) {
                    ForEach([UnitMass.kilograms, UnitMass.grams, UnitVolume.liters], id: \.self) {
                        Text($0.symbol)
                    }
                }
                Stepper("\(newIngredientViewModel.quantity) \(newIngredientViewModel.selectedUnit.symbol)", value: $newIngredientViewModel.quantity)
                Picker("Category", selection: $newIngredientViewModel.selectedCategory) {
                    ForEach(IngredientCategory.allCases, id:\.self) {
                        Text($0.rawValue)
                    }
                }
                DatePicker("Expiry Date", selection: $newIngredientViewModel.selectedExpiryDate, in: Date.now..., displayedComponents: .date)
                Button("Add") {
                    ingredientsViewModel.addNewIngredient()
                }
            }, header: { Text("Add new ingredient")}
            )
        }
    }
}

#Preview {
    IngredientsView()
}
