//
//  IngredientsView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 21/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    @State private var ingredientsViewModel = IngredientsViewModel.shared
    
    var body: some View {
        Form {
            Section {
                List($ingredientsViewModel.ingredients, id: \.id, editActions: .delete) { $ingredient in
                        Text(ingredient.display)
                }
            }
            Section(content: {
                NewIngredientView(newIngredientViewModel: ingredientsViewModel.newIngredientViewModel, addNewIngredient: ingredientsViewModel.addNewIngredient)
            }, header: { Text("Add new ingredient")}
            )
        }
    }
}

#Preview {
    IngredientsView()
}
