//
//  DetailRecipeView.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import SwiftUI

struct DetailRecipeView: View {
    var recipe: Recipe
    var body: some View {
        VStack{
            Text(recipe.name ?? "")
            
        }
    }
}

struct DetailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecipeView(recipe: Recipe.example)
    }
}
