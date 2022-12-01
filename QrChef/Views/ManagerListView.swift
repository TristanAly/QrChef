//
//  ManagerListView.swift
//  QrChef
//
//  Created by apprenant1 on 30/11/2022.
//

import SwiftUI

struct ManagerListView: View {
    
    @ObservedObject var recipeVM: RestaurantViewModel
    
    var body: some View { 
        NavigationView {
            VStack{
                Text(recipeVM.manager.name ?? "test")
                Text(recipeVM.manager.restaurant ?? "no restaurant")
                List{
                    if let recipes = recipeVM.manager.recipe {
                        ForEach(recipes, id: \.id) { recipe in
                            NavigationLink{
                                DetailRecipeView(recipe: recipe, recipeVM: RestaurantViewModel())
                            } label: {
                                HStack{
                                    AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 70 , height: 70)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    VStack{
                                        Text(recipe.name ?? "test")
                                        Text(recipe.category)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear{
                Task {
                    do {
                        recipeVM.manager = try await recipeVM.getManagerByID(id: recipeVM.manager.id)
                    } catch let error {
                        print("CAUGHT ON MESSAGES : \(error)")
                    }
                }
            }
            .navigationTitle("test manager")
        }
    }
}

struct ManagerListView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerListView(recipeVM: RestaurantViewModel())
    }
}
