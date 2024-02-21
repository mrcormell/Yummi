//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRecipesView = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isShowingRecipesView, label: {
                Text("Show Recipes")
            }).padding(.horizontal, 20)
            if isShowingRecipesView {
                RecipesView()
            } else {
                IngredientsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
