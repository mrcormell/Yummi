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
        VStack {
            Text("\(recipes[0].name)")
            Text("\(recipes[1].name)")
            Text("\(recipes[2].name)")
        }
    }
}

#Preview {
    RecipesView()
}
