//
//  Ingredient.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    let id: Int
    let name: String?
//    let ingredientRecipe: IngredientRecipe?
    
    enum CodingKeys: String, CodingKey, Codable {
        case id, name
//        case ingredientRecipe = "ingredient_recipe"
    }
}

// MARK: - IngredientRecipe
struct IngredientRecipe: Codable {
    let ingredientID: Int
    let recipeID: Int
    
    enum CodingKeys: String, CodingKey , Codable {
        case ingredientID = "ingredientId"
        case recipeID = "recipeId"
    }
}

extension Ingredient {
    static var example: Ingredient {
        Ingredient(id: 1, name: "Milk")
    }
}
