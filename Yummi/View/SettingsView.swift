//
//  SettingsView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 12/03/2024.
//

import SwiftUI

let isVegetarianKey = "IsVegetarian"
let isVeganKey = "IsVegan"
let isGlutenFreeKey = "IsGlutenFree"

struct SettingsView: View {
    @State private var isVegetarian: Bool = false
    @State private var isVegan: Bool = false
    @State private var isGlutenFree: Bool = false
    
    var body: some View {
        List {
            Toggle("Vegetarian", isOn: $isVegetarian)
            Toggle("Vegan", isOn: $isVegan)
            Toggle("Gluten-Free", isOn: $isGlutenFree)
        }
        .onChange(of: isVegetarian) {
            saveSettings()
        }
        .onChange(of: isVegan) {
            saveSettings()
        }
        .onChange(of: isGlutenFree) {
            saveSettings()
        }
        .onAppear(perform: {
            loadSettings()
        })
    }
    
    func saveSettings() {
        UserDefaults.standard.set(isVegetarian, forKey: isVegetarianKey)
        UserDefaults.standard.set(isVegan, forKey: isVeganKey)
        UserDefaults.standard.set(isGlutenFree, forKey: isGlutenFreeKey)
    }
    
    func loadSettings() {
        isVegetarian = UserDefaults.standard.bool(forKey: isVegetarianKey)
        isVegan = UserDefaults.standard.bool(forKey: isVeganKey)
        isGlutenFree = UserDefaults.standard.bool(forKey: isGlutenFreeKey)
    }
}

#Preview {
    SettingsView()
}
