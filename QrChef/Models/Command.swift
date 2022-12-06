//
//  Command.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import Foundation
//"table": "2",
//        "nbperson": 2,
//        "price": 20,
//        "date": "",
//        "hour": "",
//        "createdAt": "2022-12-02T15:32:37.470Z",
//        "updatedAt": "2022-12-02T15:32:37.470Z",
//        "userId": 1,
//        "restaurantId": 1,
//        "restaurant":
//        "user":
struct Command: Identifiable, Codable {
    let id: Int
    let table: String?
    let nbperson: Int?
    let price: Double?
    let date: String?
    let hour: String?
    let userId: Int?
    let restaurantId: Int?
    let restaurant: Restaurant?
    let user: User?
    let recipes: [Recipe]?
}


//struct Command: Identifiable, Codable {
//    var id: Int
//    var table: String?
//    var nbperson: String
//    var price: Double
//    var date: Date?
//    var hour: Date?
//}

//extension Command {
//    static var example: Command {
//        Command(id: 0, table: "75", nbperson: "5", price: 00.1, date: Date.now, hour: Date.now)
//    }
//}



extension Command {
    static var example: Command {
        Command(id: 1, table: "12", nbperson: 2, price: 12.2, date: ".now", hour: ".now",userId: 1, restaurantId: 1, restaurant: nil, user: nil, recipes: [Recipe(id: 1, name: "Steack", image: "", category: .mainCourse, priceRange: 12, description: "", createdAt: "", updatedAt: "", restaurantId: 1)])
    }
}
