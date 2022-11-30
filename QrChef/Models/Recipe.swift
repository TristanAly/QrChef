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
        Recipe(id: 1, name: "Omlette", image: "https://images-ext-2.discordapp.net/external/nvBhuSSTW6HyBihdCwSGVJIehn3ice2NA1X-VCn7JTE/%3Fixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8%26auto%3Dformat%26fit%3Dcrop%26w%3D774%26q%3D80/https/images.unsplash.com/photo-1588580261949-f17eacb905c9", category: "Plats", priceRange: "20€", welcomeDescription: "Pulled beef aux épices omlette", createdAt: "", updatedAt: "", managerID: 1, manager: Manager(id: 1, name: "Greg", email: "greg@", restaurant: "Cozy", address: "15 rue Lafaette", createdAt: "", updatedAt: ""), ingredients: [Ingredient(id: 1, name: "eggs", ingredientRecipe: IngredientRecipe(ingredientID: 1, recipeID: 1))])
    }
}



