//
//  Manager.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

//        "id": 1,
//        "name": "christine",
//        "image": "request.body.image",
//        "createdAt": "2022-12-02T15:32:20.834Z",
//        "updatedAt": "2022-12-02T15:32:20.834Z",
//        "userId": 1,
//        "user":
//        "restaurant": [
//        ]
struct Manager: Identifiable, Codable{
    let id: Int
    let name: String?
    let image: String?
    let userId: Int?
    let user: User?
    let restaurant: [Restaurant]?
}

extension Manager {
    static var example: Manager {
        Manager(id: 1, name: "test", image: "", userId: 1, user: User(id: 1, username: "", email: "", password: ""), restaurant: [Restaurant(id: 1, name: "", image: "", address: "",managerId: 1,manager: Manager(id: 1, name: "", image: "", userId: 1, user: User(id: 1, username: "", email: "", password: ""), restaurant: []), recipe: [])])
    }
}
