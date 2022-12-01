//
//  RestaurantList.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct RestaurantList: View {
    
    @ObservedObject var recipeVM: RestaurantViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Restaurants")
                    .font(.title)
                    .bold()
                    .padding()
                ScrollView{
//                    if let recipes = recipeVM.manager {
                    ForEach(recipeVM.managers, id: \.restaurant) { restau in
                            NavigationLink{
                                ManagerListView(recipeVM: recipeVM, manager: restau)
                            } label: {
                                HStack{
                                    RowRestaurantView(manager: restau)
                                }
                            }
                            Divider()
                        }
//                    }
                }
            }
            .onAppear{
                Task {
                    do {
                        recipeVM.managers = try await recipeVM.getManager()
                    } catch let error {
                        print("CAUGHT ON MESSAGES : \(error)")
                    }
                }
            }
//            .navigationTitle("Liste des restaurants")
            .toolbar {
                NavigationLink{
                    ProfilView()
                } label: {
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                }
                .padding(8)
                .padding(.top, 30)
            }
        }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList(recipeVM: RestaurantViewModel())
    }
}
