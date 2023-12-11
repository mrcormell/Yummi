//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct Ingredient: Hashable {
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
    
    var display: String {
        "\(measurement.description) of \(name) (\(category.rawValue)) which expires on \(expiryDateDisplay)"
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

struct ContentView: View {
    @State var ingredients = [Ingredient(name: "Minced Beef", measurement: Measurement(value: 600, unit: UnitMass.grams), category: .meat, expiry: Date.now.addingTimeInterval(86400)),
                       Ingredient(name: "Whole Milk", measurement: Measurement(value: 500, unit: UnitVolume.liters), category: .dairy, expiry: Date.now),
                       Ingredient(name: "Spirali Pasta", measurement: Measurement(value: 1, unit: UnitMass.kilograms), category: .cupboard, expiry: Date.now.addingTimeInterval(8640000)),
                       Ingredient(name: "Greek Yoghurt", measurement: Measurement(value: 250, unit: UnitVolume.milliliters), category: .dairy, expiry: Date.now.addingTimeInterval(86400))]
    
    @State var currentIngredientIndex = 0
    @State var enteredIngredientName = ""
    @State var selectedCategory = IngredientCategory.cupboard
    @State var selectedExpiryDate: Date = Date.now
    @State var quantity: Int = 1
    @State var selectedUnit: Dimension = UnitMass.kilograms
    
    var body: some View {
        Form {
            Section {
                Text(ingredients[currentIngredientIndex].display)
                Button("Next Ingredient") {
                    if currentIngredientIndex + 1 >= ingredients.count {
                        currentIngredientIndex = 0
                    } else {
                        currentIngredientIndex += 1
                    }
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
                    ingredients.append(Ingredient(name: enteredIngredientName, measurement: Measurement(value: Double(quantity), unit: selectedUnit), category: selectedCategory, expiry: selectedExpiryDate))
                }
            }, header: { Text("Add new ingredient")}
            )
        }

    }
}

#Preview {
    ContentView()
}
