//
//  RestaurationViewModel.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation
import SwiftUI

class RestaurantViewModel: ObservableObject {
    
    @Published var messages = [Recipe.example]
    
    let baseUrl = "http://localhost:3000/api"
    
    
    func getRecipe() async throws -> [Recipe] {
        
        guard let url = URL(string: "\(baseUrl)/recipes")
        else { fatalError("Couldn't not find URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let recipes = try decoder.decode([Recipe].self, from: data)
        print("Async decodedUser", recipes)
        return recipes
    }
}
