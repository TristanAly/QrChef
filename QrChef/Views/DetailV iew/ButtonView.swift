//
//  SwiftUIView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 29/11/2022.
//

import SwiftUI

struct ButtonView: View {
    @State var count: Int = 0
    var body: some View {
        VStack {
            HStack(spacing: 20){
                Button{
                    if count != 0 {
                        self.count -= 1
                    }
                } label: {
                    Text("-")
                        .foregroundColor(Color("Red"))
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
                } label: {
                    Text("+")
                        .foregroundColor(Color("Red"))
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
                //some action
                print("Image tapped!")
            } label: {
                Text("Ajouter pour 7,50€")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            .frame(height: 51)
            .frame(width: 358)
            .background(Color("Red"))
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
