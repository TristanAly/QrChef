//
//  SwiftUIView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 29/11/2022.
//

import SwiftUI

struct ButtonView: View {
    @State var count: Int = 1
    @State var price: Int = 7
    @ObservedObject var restaurantVM: RestaurantViewModel
    @ObservedObject var commandVM: CommandViewModel
    @State var recipeId: Int
    @State var commandId: Int
    var body: some View {
        VStack {
            HStack(spacing: 20){
                Button{
                   if count != 1 {
                        self.count -= 1
                        self.price -= 7
                  }
                } label: {
                    Text("-")
                        .foregroundColor(Color.redBurgundy)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 35, height: 35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 2))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                Text("\(count)")
                
                Button{
                        self.count += 1
                        self.price += 7
                    
                } label: {
                    Text("+")
                        .foregroundColor(Color.redBurgundy)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 35, height: 35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 2))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            
            Button{
                Task{
                    restaurantVM.recipeCommand = try await restaurantVM.PostRecipe(recipeId: recipeId, commandId: commandId)
                }
            } label: {
                Text("Ajouter pour \(price) €")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            .frame(height: 51)
            .frame(width: 358)
            .background(Color.redBurgundy)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
//        .accessibilityElement()
//        .accessibilityLabel("Value")
//        .accessibilityValue(String(price))
//        .accessibilityAdjustableAction { direction in
//            switch direction {
//            case .increment:
//                price += 1
//            case .decrement:
//                price -= 1
//            default:
//                print("Not handled.")
//            }
//        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(restaurantVM: RestaurantViewModel(), commandVM: CommandViewModel(), recipeId: 1, commandId: 1)
    }
}
