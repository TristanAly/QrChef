//
//  RecipeListView.swift
//  QrChef
//
//  Created by 1 on 29/11/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var recipeVM: RestaurantViewModel
    
    var body: some View {
        VStack{
            List{
                ForEach(recipeVM.recipes) { recipe in
                    HStack{
                        AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70 , height: 70)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            .onAppear{
                Task {
                    do {
                    recipeVM.recipes = try await recipeVM.getRecipes()
                } catch let error {
                    print("CAUGHT ON MESSAGES : \(error)")
                }
                }
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(recipeVM: RestaurantViewModel())
    }
}
