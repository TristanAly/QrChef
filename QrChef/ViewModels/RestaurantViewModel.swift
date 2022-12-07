//
//  RestaurantViewModel.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation
import SwiftUI

class RestaurantViewModel: ObservableObject {
    
    @Published var restaurants = [Restaurant.example]
    @Published var restaurant = Restaurant.example
    
    @Published var ingredient = [Ingredient.example]
    @Published var recipes = [Recipe.example]
    
    @Published var managers = [Manager.example]
    @Published var manager = Manager.example
    
    @Published var search = ""
    var searchResults: [Restaurant] {
        if search.isEmpty {
                return restaurants
            } else {
                return restaurants.filter{ item in
                    item.name!.contains(search)
                }
            }
        }
    
    let baseUrl = "http://localhost:3000/api"
    
    // MARK: RESTAURANT
    func getRestaurant() async throws -> [Restaurant] {
        
        guard let url = URL(string: "\(baseUrl)/restaurant")
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
        let restaurants = try decoder.decode([Restaurant].self, from: data)
        print("Async decodedUser", restaurants)
        return restaurants
    }
    func getRestaurantByID(id: Int) async throws -> Restaurant {
        
        guard let url = URL(string: "\(baseUrl)/restaurant/\(id)")
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
        let restaurant = try decoder.decode(Restaurant.self, from: data)
        print("Async decodedUser", restaurant)
        return restaurant
    }
    
    // MARK: Recipe
    func getRecipes() async throws -> [Recipe] {
        
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
    func getRecipeById(id: Int) async throws -> Recipe {
        
        guard let url = URL(string: "\(baseUrl)/recipes/\(id)")
        else { fatalError("Couldn't not find URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let recipe = try decoder.decode(Recipe.self, from: data)
        
        return recipe
    }
    
    // MARK: Manager
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
    
    // MARK: Ingredients
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
    
    // MARK: Recipes at Command
    func PostRecipe(recipeId: Int,commandId: Int) async throws -> RecipeCommand {
        print("1")
        guard let url = URL(string: "\(baseUrl)/recipeCommand")
        else {
            fatalError("Missing URL")
        }
        let body: [String: Int] = [ "recipeId": recipeId,"commandId": commandId]
        print(body)
        // ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        let keychainItem = KeychainItem(service: "com.Cycy.QrChef", account: "accessToken")
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(try keychainItem.readItem(), forHTTPHeaderField: "x-access-token")
        print(keychainItem)
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(2)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            print(response)
            print(ErrorMessage.badResponse)
            throw ErrorMessage.badResponse
        }
        print(3)
        let decoder = JSONDecoder()
        do {
            print(4)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let recipeCommand = try decoder.decode(RecipeCommand.self, from: data)
            print("success created: \(recipeCommand)")
            return recipeCommand
        } catch {
            print(5)
            throw URLError(.badServerResponse)
        }
    }
}
