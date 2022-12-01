//
//  OrderView.swift
//  QrChef
//
//  Created by Thibault GODEFROY on 30/11/2022.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        
        VStack {
            Image("Restaurant")
                .resizable()
                .scaledToFit()
                .frame(width: 400)
                .ignoresSafeArea()
            
            Text("Ma Commande")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                
            ScrollView {
                
                RecipeOrderView()
                
                Color.redBurgundy
                    .cornerRadius(10)
                    .frame(height: 3)
                
                RecipeOrderView()
                
                Color.redBurgundy
                    .cornerRadius(10)
                    .frame(height: 3)
                
                RecipeOrderView()
                
                Color.redBurgundy
                    .cornerRadius(10)
                    .frame(height: 3)
            } .padding()
           
        
        Button {
            
        } label: {
            ZStack{
                Color.redBurgundy
                    .frame(width: 365, height: 30)
                    .cornerRadius(40)
                Text("Ajouter un pourboire")
                    .foregroundColor(.white)
            }
        }
            HStack{ Text("Total")
                Spacer()
                Text("92.10 €")
            
            } .padding()
            ButtonOrderView()
        } .padding(.top, -50)
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

func addition(quantity: Int, price: Double) -> Double {
    return Double(quantity) * price
}
let total = addition(quantity: 1, price: 15.35)
