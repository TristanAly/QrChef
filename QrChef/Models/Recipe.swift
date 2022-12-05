//
//  Restaurant.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

//"id": 1,
//   "restaurantId": 1,
//   "recipeId": 1,
//   "updatedAt": "2022-12-02T15:32:34.172Z",
//   "createdAt": "2022-12-02T15:32:34.172Z"

struct Recipe: Identifiable, Codable {
    let id: Int
    let name: String?
    let image: String?
    let category: Category
    let priceRange: Int?
    let description: String?
    let createdAt: String
    let updatedAt: String
    let restaurantId: Int?
    var restaurant: Restaurant?
    var ingredients: [Ingredient]? //ingredients with "S"
    
//        enum CodingKeys: String, CodingKey, Codable {
//            case id, name, image, category
//            case priceRange = "price_range"
//            case welcomeDescription = "description"
//            case createdAt, updatedAt
//            case managerID = "managerId"
//            case manager, ingredients
//        }
    
}

enum Category: String, CaseIterable, Equatable, Codable {
    case mainCourse = "Main Courses"
    case starter = "Starter"
    case dessert = "Dessert"
    case drinks = "Drinks"

}

//struct RecipeRestaurant: Identifiable, Codable {
//    let id: Int
//    let restaurantId: Int?
//    let recipeId: Int?
//}


extension Recipe {
    static var example: Recipe {
        Recipe(id: 1, name: "test", image: "", category: .mainCourse, priceRange: 12, description: "description", createdAt: "", updatedAt: "", restaurantId: 1,restaurant: Restaurant(id: 1, name: "", image: "", address: "",managerId: 1,manager: Manager(id: 1, name: "", image: "", userId: 1, user: User(id: 1, username: "", email: "", password: ""), restaurant: []), recipe: []),ingredients: [Ingredient(id: 1, name: "")] )
    }
}



