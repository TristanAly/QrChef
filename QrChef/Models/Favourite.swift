//
//  Favourite.swift
//  QrChef
//
//  Created by apprenant1 on 06/12/2022.
//

import Foundation

struct Favourite:Identifiable, Codable {
    let id: Int
    let userId: Int
    let restaurantId: Int
    let restaurant: Restaurant?
    let user: User?
}
