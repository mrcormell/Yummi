//
//  TheMealDbWebAdaptor.swift
//  Yummi
//
//  Created by Cormell, David - DPC on 27/09/2024.
//

import Foundation

class TheMealDbWebAdaptor {
    let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
    let decoder = JSONDecoder()
    
    func getRandomMeal(completion: @escaping (TheMealDbMeal) -> Void) {
        //get URL
        guard let url = URL(string: baseUrl + "random.php") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let results = try? self.decoder.decode(TheMealDbResponse.self, from: data) else {
                print("Couldn't decode from JSON")
                return
            }
            
            guard let randomMeal = results.meals.first else {
                print("No random meals returned")
                return
            }
            
            completion(randomMeal)
        }
        
        task.resume()
        
    }
}
