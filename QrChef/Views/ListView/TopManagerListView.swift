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
                    .frame(maxWidth: .infinity)
                    .frame(height: 170)
                    .scaledToFill()
                    
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
            }
                
            HStack{
                VStack(alignment: .leading){
                    Text(restaurant.address ?? "test")
                        .font(.title3)
                        .bold()
                    Text(restaurant.description ?? "description")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.vertical,1)
                }
                .fontWeight(.light)
                .padding(.horizontal)
                .padding(.vertical,1)
             Spacer()
            }
        }
    }
}

struct TopPikerCategorieView_Previews: PreviewProvider {
    static var previews: some View {
        TopPikerCategorieView(restaurant: Restaurant.example)
    }
}
