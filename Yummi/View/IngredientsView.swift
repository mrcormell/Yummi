//
//  IngredientsView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 21/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    @Environment(IngredientsViewModel.self) private var ingredientsViewModel: IngredientsViewModel
    
    var body: some View {
        @Bindable var ingredientsViewModel = ingredientsViewModel
        
        Form {
            Section {
                List($ingredientsViewModel.ingredients, id: \.id, editActions: .delete) { $ingredient in
                        Text(ingredient.display)
                }
            }
            Section(content: {
                NewIngredientView(newIngredientViewModel: NewIngredientViewModel())
            }, header: { Text("Add new ingredient")}
            )
        }
    }
}

#Preview {
    IngredientsView()
}
