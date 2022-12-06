//
//  CustomSearchBar.swift
//  QrChef
//
//  Created by apprenant1 on 05/12/2022.
//

import SwiftUI

struct CustomSearchBar: View {
    @ObservedObject var restaurantVM: RestaurantViewModel
    var body: some View {
        HStack {
            TextField("search..", text: $restaurantVM.search)
            Image(systemName: "magnifyingglass.circle")
                .font(.title2)
                .foregroundColor(Color("redBurgundy"))
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 8).stroke(Color("redBurgundy"), lineWidth: 1))
        .padding()
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar(restaurantVM: RestaurantViewModel())
    }
}
