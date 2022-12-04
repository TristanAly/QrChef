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
    let nbperson: Double?
    let price: Int?
    let date: Date? 
    let hour: Date? 
    let restaurant: Restaurant?
    let user: User?
}
