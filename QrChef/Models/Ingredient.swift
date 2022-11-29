//
//  Ingredient.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

struct Ingredient: Codable {
    let id: Int
    let name, createdAt, updatedAt: String
    let ingredientRecipe: IngredientRecipe

    enum CodingKeys: String, CodingKey {
        case id, name, createdAt, updatedAt
        case ingredientRecipe = "ingredient_recipe"
    }
}

// MARK: - IngredientRecipe
struct IngredientRecipe: Codable {
    let createdAt, updatedAt: String
    let ingredientID, recipeID: Int

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt
        case ingredientID = "ingredientId"
        case recipeID = "recipeId"
    }
}
