//
//  ListCategorieView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct ListCategorieView: View {
    @ObservedObject var recipeVM : RestaurantViewModel
    var category : Category
    
    var body: some View {
        List{
            if let recipes = recipeVM.restaurant.recipe {
                ForEach(recipes, id: \.id) { recipe in
                    if recipe.category == category {
                        NavigationLink{
                            DetailRecipeView(recipe: recipe, recipeVM: RestaurantViewModel())
                        } label: {
                            RowRecipesView(recipe: recipe)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ListCategorieView_Previews: PreviewProvider {
    static var previews: some View {
        ListCategorieView(recipeVM: RestaurantViewModel(), category: Category.mainCourse)
    }
}
