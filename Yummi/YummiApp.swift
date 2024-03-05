//
//  YummiApp.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import SwiftUI

@main
struct YummiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(IngredientsViewModel())
        }
    }
}
