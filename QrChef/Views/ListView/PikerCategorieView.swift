//
//  PikerCategorieView.swift
//  QrChef
//
//  Created by apprenant1 on 30/11/2022.
//

import SwiftUI

struct PikerCategorieView: View {
    
    @ObservedObject var recipeVM: RestaurantViewModel
    @State var selected: Category = .mainCourse
    @State var test = false
    @State var reservation = false

    var table : Table
    var restaurant: Restaurant
    var body: some View {
        VStack{
            TopPikerCategorieView(restaurant: restaurant)
            //                .padding(.horizontal)
            ButtonReservationView(reservation: $reservation)
            if reservation {
                Picker("What is your favorite flavour?", selection: $selected) {
                    ForEach(Category.allCases, id: \.rawValue) { category in
                        Text(category.rawValue).tag(category)
                    }
                }.background(Color.accentColor.opacity(0.9))
                    .pickerStyle(.segmented)
                    .cornerRadius(10)
                    .padding()
                
                switch true {
                case selected == Category.mainCourse:
                    ListCategorieView(recipeVM: recipeVM, category: .mainCourse)
                case selected == Category.starter:
                    ListCategorieView(recipeVM: recipeVM, category: .starter)
                case selected == Category.dessert:
                    ListCategorieView(recipeVM: recipeVM, category: .dessert)
                case selected == Category.drinks:
                    ListCategorieView(recipeVM: recipeVM, category: .drinks)
                default:
                    EmptyView()
                }
            }else {
               ReservationView(restaurantVM: recipeVM)
            }
        }
                .onAppear{
                    Task {
                        do {
                            recipeVM.restaurant = try await recipeVM.getRestaurantByID(id: restaurant.id)
                        } catch let error {
                            print("CAUGHT ON MESSAGES : \(error)")
                        }
                    }
                }
        
            .toolbar{
                ToolbarItem {
                    Button {
                        test.toggle()
                    } label: {
                        VStack{
                            Image(systemName: test ? "newspaper.circle" : "newspaper.circle.fill")
                            Text(test ? "Cart vide" : "Cart plein")
                        }
                        .padding(.top,2)
                    }
                }
            }
        .navigationTitle(restaurant.name ?? "")
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PikerCategorieView_Previews: PreviewProvider {
    static var previews: some View {
        PikerCategorieView(recipeVM: RestaurantViewModel(), table: tableArray[0], restaurant: Restaurant.example)
    }
}
