//
//  Manager.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import Foundation

struct Manager: Codable {
    let id: Int
    let name, email, restaurant, address: String
    let createdAt, updatedAt: String
}
