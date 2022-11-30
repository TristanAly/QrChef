//
//  SwiftUIView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 29/11/2022.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
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

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
