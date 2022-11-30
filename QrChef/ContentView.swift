//
//  ContentView.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//       RecipeListView(recipeVM: RestaurantViewModel())
        ManagerListView(recipeVM: RestaurantViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
