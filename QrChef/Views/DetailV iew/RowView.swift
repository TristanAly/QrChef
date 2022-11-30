//
//  RowView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 29/11/2022.
//

import SwiftUI

struct RowView: View {
    var ingredient: Ingredient
    var body: some View {
        
        HStack {
            Image("food")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 67)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
            Spacer()
            Text(ingredient.name ?? "")
                .fontWeight(.regular)
                .font(.system(size: 24))
            Spacer()

            Button{
                //some action
                print("Image tapped!")
            } label: {
                Text("-")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .frame(width: 35, height: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 5))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(ingredient: Ingredient.example)
    }
}
