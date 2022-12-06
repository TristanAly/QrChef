//
//  User.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import Foundation


struct User: Identifiable, Codable {
    let id: Int
    let username: String
    let email: String
    let password: String
}

extension User {
    static var example: User {
        User(id: 1, username: "Chris", email: "fgdhdhbhd", password: "xfcgh")
    }
}
