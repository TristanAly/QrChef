//
//  Restaurant.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: Int
    let name: String?
    let image: String?
    let category: String
    let priceRange: String?
    let welcomeDescription: String?
    let createdAt: String
    let updatedAt: String
    let managerID: Int?
    var manager: Manager?
    var ingredients: [Ingredient]?
    
        enum CodingKeys: String, CodingKey, Codable {
            case id, name, image, category
            case priceRange = "price_range"
            case welcomeDescription = "description"
            case createdAt, updatedAt
            case managerID = "managerId"
            case manager, ingredients
        }
}

extension Recipe {
    static var example: Recipe {
        Recipe(id: 1, name: "", image: "", category: "", priceRange: "", welcomeDescription: "", createdAt: "", updatedAt: "", managerID: 1, manager: Manager(id: 1, name: "", email: "", restaurant: "", address: "", createdAt: "", updatedAt: "", recipe: []), ingredients: [Ingredient(id: 1, name: "", ingredientRecipe: IngredientRecipe(ingredientID: 1, recipeID: 1))])
    }
}



