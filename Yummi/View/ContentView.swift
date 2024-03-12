//
//  ContentView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecipesView()
                .tabItem {
                    Label("Recipes", systemImage: "doc.plaintext")
                }
            
            IngredientsView()
                .tabItem {
                    Label("Pantry", systemImage: "cube.box")
                }
        }
    }
}

#Preview {
    ContentView()
}
