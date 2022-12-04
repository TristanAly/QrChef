//
//  RowRecipeView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct RowRecipesView: View {
    var recipe: Recipe
    var body: some View {
        HStack{
          
            VStack(alignment: .leading){
                Text(recipe.name ?? "test")
                    .font(.title)
                Text(recipe.description ?? "")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text("\(recipe.priceRange ?? 2) €")
                    .font(.callout)
                    .bold()
                    
            }
            .padding(.horizontal)
            Spacer()
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80 , height: 80)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            .padding(.horizontal)
        }
    }
}

struct RowRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RowRecipesView(recipe: Recipe.example)
    }
}
