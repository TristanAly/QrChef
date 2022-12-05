////
////  RestaurantList.swift
////  QrChef
////
////  Created by apprenant1 on 01/12/2022.
////
import SwiftUI

struct RestaurantList: View {
    
    @StateObject private var restaurantVM = RestaurantViewModel()
    @State var search = ""
    @State var isfavorite = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                HStack{
                    Text("Book for dinner tonight")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
                VStack{
                    ScrollView{
                        ForEach(restaurantVM.restaurants, id: \.id) { restaurant in
                            NavigationLink{
                                PikerCategorieView(recipeVM: restaurantVM, restaurant: restaurant)
                            } label: {
                                HStack{
                                    NewRowRestaurantView(restaurant: restaurant, isfavorite: $isfavorite)
                                }
                                .foregroundColor(.black)
                            }
                            .searchable(text: $search)
                        }.padding()
                    }
                }.onAppear{
                    Task{
                        restaurantVM.restaurants = try await restaurantVM.getRestaurant()
                    }
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
        .navigationBarHidden(true)
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
            .environmentObject(RestaurantViewModel())
    }
}
