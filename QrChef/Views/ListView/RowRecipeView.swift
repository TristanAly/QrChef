//
//  RowRecipeView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct RowRecipeView: View {
    var recipe: Recipe
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70 , height: 70)
            } placeholder: {
                ProgressView()
            }
          
            VStack(alignment: .leading){
                Text(recipe.name ?? "test")
                    .font(.title)
                Text(recipe.description ?? "")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    
            }
            
            .padding()
            Spacer()
            Text(recipe.priceRange ?? "")
                .padding(.ulpOfOne)
            
        }
    }
}

struct RowRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RowRecipeView(recipe: Recipe.example)
    }
}
