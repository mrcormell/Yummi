//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var contentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Toggle(isOn: $contentViewModel.isShowingRecipesView, label: {
                Text("Show Recipes")
            }).padding(.horizontal, 20)
            if contentViewModel.isShowingRecipesView {
                RecipesView(recipesViewModel: contentViewModel.recipesViewModel, getRecipesCanMake: contentViewModel.recipesCanMake)
            } else {
                IngredientsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
