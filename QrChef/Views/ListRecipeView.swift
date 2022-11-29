//
//  ListRecipeView.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import SwiftUI

struct ListRecipeView: View {
    
    @ObservedObject var recipeVM: RestaurantViewModel
    
    var body: some View {
        List{
            ForEach(recipeVM.messages, id: \.id) { recipe in
                Text(recipe.name)
            }
        }
    }
}

struct ListRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ListRecipeView()
    }
}
