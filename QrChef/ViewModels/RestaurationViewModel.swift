//
//  RestaurationViewModel.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation
import SwiftUI

class RestaurantViewModel: ObservableObject {
    @Published var ingredient = [Ingredient.example]
    @Published var recipes = [Recipe.example]
    @Published var managers = [Manager.example]
    @Published var manager = Manager.example
    
    let baseUrl = "http://localhost:3000/api"
    
    
    func getRecipe() async throws -> [Recipe] {
        
        guard let url = URL(string: "\(baseUrl)/recipes")
        else { fatalError("Couldn't not find URL") }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        print("2")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let recipes = try decoder.decode([Recipe].self, from: data)
        print("Async decodedUser", recipes)
        return recipes
    }
    
    func getManager() async throws -> [Manager] {
        
        guard let url = URL(string: "\(baseUrl)/managers")
        else { fatalError("Couldn't not find URL") }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        print("2")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let managers = try decoder.decode([Manager].self, from: data)
        print("Async decodedUser", managers)
        return managers
    }
    
    func getManagerByID(id: Int) async throws -> Manager {
        
        guard let url = URL(string: "\(baseUrl)/managers/\(id)")
        else { fatalError("Couldn't not find URL") }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        print("2")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let managers = try decoder.decode(Manager.self, from: data)
        print("Async decodedUser", managers)
        return managers
    }
    
    func getIngredient() async throws -> [Ingredient] {
        
        guard let url = URL(string: "\(baseUrl)/ingredients")
        else { fatalError("Couldn't not find URL") }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        print("2")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let ingredient = try decoder.decode([Ingredient].self, from: data)
        print("Async decodedUser", ingredient)
        return ingredient
    }
    
}
