//
//  NewRowRestaurantView.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import SwiftUI

struct NewRowRestaurantView: View {
    var restaurant: Restaurant
    @Binding var isfavorite: Bool
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: restaurant.image ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 380, height: 130)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 380, height: 130)
            }
            
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(restaurant.name ?? "")
                            .font(.title)
                        Text(restaurant.address ?? "")
                            .font(.subheadline)
                    }.padding()
                    Spacer()
                }
                .foregroundColor(Color("redBurgundy"))
            }
            //            .frame(width: 380, height: 100)
            .background(Rectangle().fill(.white))
            .overlay(
                Button{
                    isfavorite.toggle()
                } label: {
                    Image(systemName: isfavorite ? "bookmark.fill" : "bookmark")
                        .font(.title3)
                        .foregroundColor(Color("redBurgundy"))
                        .padding()
                },alignment: .topTrailing
            )
        }.overlay(
            RoundedRectangle(cornerRadius: 8).stroke(Color("redBurgundy"), lineWidth: 2)
                .shadow(radius: 5).frame(width: 380, height: 220))
        .padding(10)
    }
}

struct NewRowRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRowRestaurantView(restaurant: Restaurant.example, isfavorite: .constant(false))
    }
}
