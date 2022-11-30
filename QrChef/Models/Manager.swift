//
//  Manager.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

struct Manager: Identifiable, Codable {
    let id: Int
    let name, email, restaurant, address: String?
    let createdAt, updatedAt: String
    let recipe: [Recipe]?
}

extension Manager {
    static var example: Manager {
        Manager(id: 1, name: "", email: "", restaurant: "", address: "", createdAt: "", updatedAt: "", recipe: [Recipe(id: 1, name: "", image: "", category: "", priceRange: "", welcomeDescription: "", createdAt: "", updatedAt: "", managerID: 1)])
    }
}
