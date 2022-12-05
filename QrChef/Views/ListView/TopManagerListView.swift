//
//  TopManagerListView.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import SwiftUI

struct TopPikerCategorieView: View {
    var restaurant: Restaurant
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: restaurant.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
                
            HStack{
                VStack(alignment: .leading){
                    Text(restaurant.address ?? "test")
                        .font(.title3)
                        .bold()
                        Text("Descriptif Descriptif Descriptif Descriptif Descriptif Descriptif Descriptif Descriptif Descriptif Descriptif Descriptif Descriptif")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                .font(.caption)
                .padding(.horizontal)
                .padding(.vertical,1)
             Spacer()
            }
            HStack{
                Text("Notre Menu")
                    .font(.title2)
                    .bold()
                    
                Spacer()
                Image(systemName: "cart.circle")
                    .font(.title)
                    .foregroundColor(.accentColor)
               
            }
            .padding(.horizontal)
        }
    }
}

struct TopPikerCategorieView_Previews: PreviewProvider {
    static var previews: some View {
        TopPikerCategorieView(restaurant: Restaurant.example)
    }
}
