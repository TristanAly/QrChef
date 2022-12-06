//
//  Restaurant.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import Foundation

struct Restaurant: Identifiable, Codable {
    let id: Int
    let name: String?
    let image: String?
    let address: String?
    let description: String?
    let managerId: Int?
    let manager: Manager?
    let recipe: [Recipe]?
}

extension Restaurant {
    static var example: Restaurant {
        Restaurant(id: 1, name: "Le Ritz", image: "https://media-cdn.tripadvisor.com/media/photo-s/0e/8b/02/10/photo7jpg.jpg", address: "7 rue des freds", description: "description",managerId: 1,manager: Manager(id: 1, name: "", image: "", userId: 1, user: User(id: 1, username: "", email: "", password: ""), restaurant: []), recipe: [Recipe(id: 1, name: "omelette", image: "", category: .mainCourse, priceRange: 8, description: "Omelette au fromage et à la ciboulette", createdAt: "", updatedAt: "", restaurantId: 1)])
    }
}
