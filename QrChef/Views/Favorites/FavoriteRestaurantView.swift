//
//  FavoriteRestaurantView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct FavoriteRestaurantView: View {
    @ObservedObject var FavouriteVM: FavouriteViewModel
    @ObservedObject var RestaurantVM: RestaurantViewModel
    var body: some View {
        NavigationView {
            List{
                ForEach(FavouriteVM.favourites) { favourite in
                    NavigationLink {
                        
                    } label : {
                        RowRestaurantView(restaurant: RestaurantVM.restaurant)
                    }
                }
            }.listStyle(.plain)
                .onAppear{
                    Task {
                        FavouriteVM.favourites = try await FavouriteVM.getFavourites()
                    }
                    Task {
                        RestaurantVM.restaurant = try await RestaurantVM.getRestaurantByID(id: FavouriteVM.favourite.restaurantId ?? 1)
                    }
                }.navigationTitle("My Favourite")
        }
    }
}

struct FavoriteRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRestaurantView(FavouriteVM: FavouriteViewModel(), RestaurantVM: RestaurantViewModel())
    }
}
