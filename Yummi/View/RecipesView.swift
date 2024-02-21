//
//  RecipesView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 01/02/2024.
//

import SwiftUI

struct RecipesView: View {
    var recipes: [Recipe] = Recipe.examples
    
    var sortedByRatingRecipes: [Recipe] {
        recipes.sorted(by: { $0.rating > $1.rating })
    }
    
    var body: some View {
        List {
            ForEach(sortedByRatingRecipes, id: \.name) { recipe in
                HStack {
                    Image(recipe.imageFilepath)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60,height: 70)
                        .clipped()
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                        Text("Serves \(recipe.numberServes)")
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: "\(recipe.ingredients.count).circle")
                    if recipe.isFavourite {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                }
            }
        }
    }
}

#Preview {
    RecipesView()
}
