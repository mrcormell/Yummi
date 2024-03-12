//
//  IngredientsView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 20/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    @State private var ingredientsViewModel = IngredientsViewModel.shared
    
    var body: some View {
        Form {
            Section {
                List {
                    ForEach(ingredientsViewModel.myIngredients) { ingredient in
                        Text(ingredient.display)
                    }
                }
                Button("Add to Pantry") {
                    ingredientsViewModel.showingAddNewIngredient = true
                }
            }
        }
        .sheet(isPresented: $ingredientsViewModel.showingAddNewIngredient) {
            Form {
                Section {
                    TextField("Name", text: $ingredientsViewModel.newIngredientName)
                    Picker("Category", selection: $ingredientsViewModel.newIngredientCategory) {
                        Text("Meat").tag("Meat")
                        Text("Fish").tag("Fish")
                        Text("Dairy").tag("Dairy")
                        Text("Cupboard").tag("Cupboard")
                        Text("Fruit / Vegetable").tag("Fruit / Vegetable")
                    }
                    Picker("Unit", selection: $ingredientsViewModel.newIngredientUnit) {
                        Text("g").tag("g")
                        Text("ml").tag("ml")
                        Text("units").tag("units")
                    }
                    Stepper("\(ingredientsViewModel.newIngredientQuantity) \(ingredientsViewModel.newIngredientUnit)", value: $ingredientsViewModel.newIngredientQuantity)
                    DatePicker("Expiry Date", selection: $ingredientsViewModel.newIngredientExpiry, displayedComponents: .date)
                    Button("Add") {
                        ingredientsViewModel.addNewIngredient()
                    }
                }
            }
        }
    }
}

#Preview {
    IngredientsView()
}
