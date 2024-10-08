//
//  TheMealDbResponse.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/09/2024.
//

import Foundation

struct TheMealDbResponse: Decodable {
    let meals: [TheMealDbMeal]
}

struct TheMealDbMeal: Decodable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let strSource: String
    

}
