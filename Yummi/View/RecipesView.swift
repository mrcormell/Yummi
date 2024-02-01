//
//  RecipesView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import SwiftUI

struct RecipesView: View {
    var recipes: [Recipe] = Recipe.examples
    
    var body: some View {
        List {
            ForEach(recipes, id: \.name) { recipe in
                Text(recipe.name)
            }
        }
    }
}

#Preview {
    RecipesView()
}
