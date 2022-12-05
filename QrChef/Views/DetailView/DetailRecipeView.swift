//
//  DetailRecipeView.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.


import SwiftUI

struct DetailRecipeView: View {
    @State var recipe: Recipe
    @ObservedObject var recipeVM: RestaurantViewModel
    
    var body: some View {
//        NavigationView {
            
            VStack(alignment: .center){
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.redBurgundy)
                        .frame(width: 160, height: 200)
                        .shadow(color: .gray, radius: 5)
                    VStack {
                        AsyncImage(url: URL(string: recipe.image ?? "")) {
                            image in image
                                .resizable()
                                .scaledToFill()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 150, height: 190)
                       
                    .cornerRadius(5)
                    }
                }
            
                VStack(alignment: .leading, spacing: 10) {
                    Text(recipe.name ?? "")
                        .fontWeight(.medium)

                    Text(recipe.description ?? "")
                        .font(.title3)

                        .fontWeight(.light)
                    
                }
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .padding()
                    ScrollView{
                        //            List {
                        if let ingredient = recipe.ingredients {
                            ForEach(ingredient, id: \.id) { item in
                                RowView(ingredient: item)
                                    .padding()
                                
                            }
                        }
                    }
                    
                }
                
                ButtonView()
                   // .padding(15)
            }
            .onAppear{
                Task {
                    do {
                        recipe = try await recipeVM.getRecipeById(id: recipe.id)
                        print(recipe)
                    } catch let error {
                        print("CAUGHT ON MESSAGES : \(error)")
                    }
                }
            }
           // .ignoresSafeArea()
//            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
//  }
    }
}

struct DetailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecipeView(recipe: Recipe.example, recipeVM: RestaurantViewModel())
    }
}
