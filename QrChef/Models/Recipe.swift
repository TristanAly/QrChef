//
//  Restaurant.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: Int
    let name, image, category, priceRange: String
    let welcomeDescription, createdAt, updatedAt: String
    let managerID: Int
    let manager: Manager
    let ingredients: [Ingredient]

    enum CodingKeys: String, CodingKey {
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
       Recipe(id: 1, name: "", image: "", category: "", priceRange: "", welcomeDescription: "", createdAt: "", updatedAt: "", managerID: 1, manager: Manager(id: 1, name: "", email: "", restaurant: "", address: "", createdAt: "", updatedAt: ""), ingredients: [Ingredient(id: 1, name: "", createdAt: "", updatedAt: "", ingredientRecipe: IngredientRecipe(createdAt: "", updatedAt: "", ingredientID: 1, recipeID: 1))])
    }
}



