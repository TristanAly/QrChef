//
//  FavoriteRestaurantView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct FavoriteRestaurantView: View {
    var body: some View {
        List{
            RowRestaurantView(restaurant: Restaurant.example)
        }
    }
}

struct FavoriteRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRestaurantView()
    }
}
