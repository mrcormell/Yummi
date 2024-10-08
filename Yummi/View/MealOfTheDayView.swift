//
//  MealOfTheDayView.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 08/10/2024.
//

import SwiftUI

struct MealOfTheDayView: View {
    @State var mealDbMeal: TheMealDbMeal? = nil
    let mealDbAdaptor = TheMealDbWebAdaptor()
    
    var body: some View {
        VStack {
            if let meal = mealDbMeal {
                    Text("\(meal.strMeal)")
                        .font(.largeTitle)
                    Text("Category: \(meal.strCategory)")
                    Divider()
                    Text("Steps: \(meal.strInstructions)")
                    Divider()
                    Text("Source \(meal.strSource)")
                        .font(.caption)
            }
        }
        .padding()
        .onAppear(perform: {
            mealDbAdaptor.getRandomMeal(completion: { meal in
                self.mealDbMeal = meal
            })
        })
    }
}

#Preview {
    MealOfTheDayView()
}
