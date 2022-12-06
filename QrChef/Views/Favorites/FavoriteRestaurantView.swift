//
//  FavoriteRestaurantView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct FavoriteRestaurantView: View {
    @ObservedObject var FavouriteVM: FavouriteViewModel
    var body: some View {
        List{
            ForEach(FavouriteVM.favourites) { favourite in
//                RowRestaurantView(restaurant: favourite)
            }
        }.listStyle(.plain)
        .onAppear{
            Task {
                FavouriteVM.favourites = try await FavouriteVM.getFavourites(token: KeychainItem.currentUserIdentifier)
            }
        }
    }
}

struct FavoriteRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRestaurantView(FavouriteVM: FavouriteViewModel())
    }
}
