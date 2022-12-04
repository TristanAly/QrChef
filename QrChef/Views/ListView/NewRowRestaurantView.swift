//
//  NewRowRestaurantView.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import SwiftUI

struct NewRowRestaurantView: View {
    var restaurant: Restaurant
    var body: some View {
        VStack{
            Image("Restaurant")
                .resizable()
                .frame(width: 380, height: 150)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(restaurant.name ?? "")
                            .font(.title)
                        Text(restaurant.address ?? "")
                            .font(.subheadline)
                    }.padding(.horizontal)
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(restaurant.name ?? "")
                            .font(.title)
                        Text(restaurant.address ?? "")
                            .font(.title)
                    }
                    .padding(.horizontal)
                }
            }
            .frame(width: 380, height: 70)
            .background(Rectangle().fill(.red).frame(width: 380, height: 100))
        }
        .cornerRadius(8)
    }
}

struct NewRowRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRowRestaurantView(restaurant: Restaurant.example)
    }
}
