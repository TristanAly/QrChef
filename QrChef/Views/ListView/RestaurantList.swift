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
                HStack{
                    Text("Book for dinner tonight")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                    NavigationLink{
                        ProfilView()
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.title)
                    }
                    .padding(8)
                }
                ScrollView(showsIndicators: false){
                    VStack(spacing: 20){
                    ForEach(recipeVM.managers, id: \.restaurant) { restau in
                            NavigationLink{
                                ManagerListView(recipeVM: recipeVM, manager: restau)
                            } label: {
                                    HStack{
                                        NewRowRestaurantView(manager: restau)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                    }.padding()
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList(recipeVM: RestaurantViewModel())
    }
}
