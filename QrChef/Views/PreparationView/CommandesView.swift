//
//  CommandesView.swift
//  QrChef
//
//  Created by Thibault GODEFROY on 30/11/2022.
//

import SwiftUI

struct CommandesView: View {
    var recipe : Recipe
    var body: some View {
        
        HStack{
            Image("Restaurant")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading){
                Text("Nom de la recette")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(2)
                Text("En cours de préparation")
                    .font(.system(size: 16))
                    .padding(2)
                Text("Votre commande arrive")
                    .font(.system(size: 16))
                    .padding(2)
                    
            } .padding(25)
        }
    }
}

struct CommandesView_Previews: PreviewProvider {
    static var previews: some View {
        CommandesView(recipe: Recipe.example)
    }
}
