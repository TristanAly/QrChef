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
        
        VStack(alignment: .center){
            
            Image("Restaurant")
                .resizable()
                .scaledToFit()
                .frame(width: 500)
//                .edgesIgnoringSafeArea(.top)
                
            HStack {
                AsyncImage(url: URL(string: recipe.image ?? "")) {
                    image in image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio( contentMode: .fit)
                        .frame(height: 100)
                        .cornerRadius(8)
                    
                } placeholder: {
                    ProgressView()
                }
                
//                                .frame(height: 150)
                VStack(alignment: .leading, spacing: 10) {
                    Text(recipe.name ?? "")
                        .font(.title2)
                        .fontWeight(.medium)
                    Text(recipe.welcomeDescription ?? "")
                        .font(.title3)
                        .fontWeight(.light)
                    
                }
            }
           
            VStack(alignment: .leading){
                Text("Ingrédients:")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                ScrollView{
                    //            List {
                    if let ingredient = recipe.ingredient {
                        ForEach(ingredient, id: \.id) { item in
                            RowView(ingredient: item)
                                .padding()
                            
                        }
                    }
                }
                
            }
//            Spacer()
                ButtonView()
                
//            }
        }
//        .padding()
    }
}

struct DetailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecipeView(recipe: Recipe.example)
    }
}
