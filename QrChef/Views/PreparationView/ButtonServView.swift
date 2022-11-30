//
//  ButtonServView.swift
//  QrChef
//
//  Created by Thibault GODEFROY on 30/11/2022.
//

import SwiftUI

struct ButtonServView: View {
    var body: some View {
        Button {
            
        } label: {
            ZStack{
                Color.redBurgundy
                    .frame(height: 50)
                    .cornerRadius(10)
                    .padding()
                Text("Appeler un serveur")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ButtonServView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonServView()
    }
}
