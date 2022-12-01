//
//  ButtonOrderView.swift
//  QrChef
//
//  Created by Thibault GODEFROY on 30/11/2022.
//

import SwiftUI

struct ButtonOrderView: View {
    var body: some View {
        Button {
            
        } label: {
            ZStack{
                Color.redBurgundy
                    .frame(height: 50)
                    .cornerRadius(10)
                    .padding()
                Text("Payer l'addition")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ButtonOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonOrderView()
    }
}
