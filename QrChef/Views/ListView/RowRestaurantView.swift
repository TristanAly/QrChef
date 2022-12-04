////
////  RowRestaurantView.swift
////  QrChef
////
////  Created by apprenant1 on 01/12/2022.
////
//
import SwiftUI

struct RowRestaurantView: View {
    var restaurant: Restaurant
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(restaurant.name ?? "no restaurant")
                    .font(.title)
                Text(restaurant.address ?? "test")
            }
            .padding()
            Spacer()
            AsyncImage(url: URL(string: restaurant.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80 , height: 80)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct RowRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RowRestaurantView(restaurant: Restaurant.example)
    }
}
