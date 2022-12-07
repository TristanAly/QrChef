////
////  RestaurantList.swift
////  QrChef
////
////  Created by apprenant1 on 01/12/2022.
////
import SwiftUI

struct RestaurantList: View {
    
    @StateObject private var restaurantVM = RestaurantViewModel()
    @StateObject private var favouriteVM = FavouriteViewModel()
    @State var isfavorite = false
    var body: some View {
        NavigationView {
            VStack{
                CustomSearchBar(restaurantVM: restaurantVM)
                VStack{
                    ScrollView{
                        ForEach(restaurantVM .searchResults, id: \.id) { restaurant in
                            NavigationLink{
                                PikerCategorieView(recipeVM: restaurantVM,restaurant: restaurant)
                            } label: {
                                HStack{
                                    NewRowRestaurantView(favoriteVM: favouriteVM, restaurant: restaurant, isfavorite: isfavorite)
                                }
                                .foregroundColor(.black)
                            }
                            
                            
                            
                        }.padding()
                    }
                }.onAppear{
                    Task{
                        restaurantVM.restaurants = try await restaurantVM.getRestaurant()
                    }
                }
                .toolbar{
                    ToolbarItem {
                        NavigationLink{
                            ProfilView()
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .font(.title2)
                        }
                        .padding()
                    }
                    
                }
            }
            
            .navigationBarTitle("Réservation")
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList(isfavorite: false)
            .environmentObject(RestaurantViewModel())
    }
}
