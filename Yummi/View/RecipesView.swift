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
                HStack {
                    if recipe.isFavourite {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                    Text(recipe.name)
                    Spacer()
                    Image(systemName: "\(recipe.ingredients.count).circle")
                }
            }
        }
    }
}

#Preview {
    RecipesView()
}
