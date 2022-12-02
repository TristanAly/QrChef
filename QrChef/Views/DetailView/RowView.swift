//
//  RowView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 29/11/2022.
//

import SwiftUI

struct RowView: View {
    @State private var didTap: Bool = false

    var ingredient: Ingredient
    var body: some View {
        
        HStack {
            Image(systemName: "carrot")
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 50)
                .foregroundColor(.redBurgundy)
            Spacer()
            HStack{
                Text("aaaa")
                    .offset(x: 50)
                    .foregroundColor(.clear)
                    .strikethrough(didTap ? true : false, color: Color.redBurgundy)
                    .fontWeight(.regular)
                   .font(.system(size: 24))
                Text(ingredient.name ?? "")
                   .frame(width: 100)
                   .foregroundColor(didTap ? Color.redBurgundy : Color.black )
                   .strikethrough(didTap ? true : false, color: Color.redBurgundy)
                    .fontWeight(.regular)
                .font(.system(size: 24))
                Text("aaaa")
                   .offset(x: -50)
                    .foregroundColor(.clear)
                    .strikethrough(didTap ? true : false, color: Color.redBurgundy)
                    .fontWeight(.regular)
                   .font(.system(size: 20))

            }
            Spacer()
            
            Button{
                didTap.toggle()
                

            } label: {
                Text("-")
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.black)
                    .background(didTap ? Color.redBurgundy : Color.clear)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 1))
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(ingredient: Ingredient.example)
    }
}
