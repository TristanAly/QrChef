//
//  ManagerListView.swift
//  QrChef
//
//  Created by apprenant1 on 30/11/2022.
//

import SwiftUI

struct ManagerListView: View {
    
    @ObservedObject var recipeVM: RestaurantViewModel
    @State var selected: Category = .mainCourse
    var manager: Manager
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text(manager.address ?? "test")
                    .font(.headline)
                Text(manager.name ?? "test")
                    .font(.headline)
            }.padding()
            .padding()
            Picker("What is your favorite flavour?", selection: $selected) {
                ForEach(Category.allCases, id: \.rawValue) { category in
                    Text(category.rawValue).tag(category)
                }
            }.background(Color.accentColor.opacity(0.3))
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
        }
        .onAppear{
            Task {
                do {
                    recipeVM.manager = try await recipeVM.getManagerByID(id: manager.id)
                } catch let error {
                    print("CAUGHT ON MESSAGES : \(error)")
                }
            }
        }
        
        .navigationTitle(manager.restaurant ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ManagerListView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerListView(recipeVM: RestaurantViewModel(), manager: Manager.example)
    }
}
