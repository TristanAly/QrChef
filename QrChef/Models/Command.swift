//
//  Command.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import Foundation


struct Command: Identifiable, Codable {
    let id: Int
    let table: String?
    let nbperson: Int?
    let price: Double?
    let date: String?
    let hour: String?
    let userId: Int?
    let restaurantId: Int?
    let ingredientCommandId: Int?
    let restaurant: Restaurant?
    let user: User?
    let recipes: [Recipe]?
    let ingredients: [Ingredient]?
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
        Command(id: 1, table: "12", nbperson: 1, price: 20.00, date: dateFormatter.string(from: Date.now), hour: hourFormatter.string(from: Date.now), userId: 1, restaurantId: 1, ingredientCommandId: 1, restaurant: Restaurant.example, user: User.example, recipes: [Recipe.example], ingredients: [Ingredient.example])
    }
}

let hourFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    formatter.locale = Locale(identifier: "FR-fr")
//    formatter.dateFormat = "HH':'mm'L'"
//    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
}()

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeStyle = .long
    formatter.locale = Locale(identifier: "FR-fr")
    formatter.dateFormat = "HH':'mm'L'"
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
}()
