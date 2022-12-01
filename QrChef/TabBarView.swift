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
            RestaurantList(recipeVM: RestaurantViewModel())
                .tabItem {
                    VStack{
                        Image(systemName: "fork.knife.circle.fill")
                        Text("Restaurants")
                    }
                }
            FavoriteRestaurantView()
                .tabItem {
                    VStack{
                        Image(systemName: "heart.circle.fill")
                        Text("Favourite")
                    }
                }
           BookingView()
                .tabItem {
                    VStack{
                        Image(systemName: "calendar.circle.fill")
                        Text("Booking")
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
