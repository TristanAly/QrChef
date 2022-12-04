//
//  SignInResponse.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import Foundation


struct SignInResponse: Codable, Identifiable {
        var id: Int
        var username: String
        var email: String
        var password: String
        var roles: [String]
        var accessToken: String
}
