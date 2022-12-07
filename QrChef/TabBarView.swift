//
//  TabBarView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            RestaurantList()
                .tabItem {
                    VStack{
                        Image(systemName: "fork.knife.circle.fill")
                        Text("Restaurants")
                    }
                }
            FavoriteRestaurantView(FavouriteVM: FavouriteViewModel(), RestaurantVM: RestaurantViewModel())
                .tabItem {
                    VStack{
                        Image(systemName: "heart.circle.fill")
                        Text("Favourite")
                    }
                }
            ProfilView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle.fill")
                        Text("Profil")
                    }
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
