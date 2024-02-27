//
//  NewIngredientView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/02/2024.
//

import SwiftUI

struct NewIngredientView: View {
    @Bindable var newIngredientViewModel: NewIngredientViewModel
    let addNewIngredient: () -> ()
    
    var body: some View {
        Group {
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
                addNewIngredient()
            }
        }
    }
}

#Preview {
    Form {
        Section(content: {
            NewIngredientView(newIngredientViewModel: NewIngredientViewModel.shared, addNewIngredient: IngredientsViewModel.shared.addNewIngredient)
        }, header: { Text("Add new ingredient")}
        )
    }
}
