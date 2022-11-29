//
//  Restaurant.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

struct Restaurant: Codable {
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




