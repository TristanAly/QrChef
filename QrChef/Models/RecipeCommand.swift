//
//  RecipeCommand.swift
//  QrChef
//
//  Created by apprenant1 on 07/12/2022.
//

import Foundation

struct RecipeCommand: Identifiable, Codable{
    let id: Int
    let commandId: Int
    let recipeId: Int
}
