//
//  ProfilView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct ProfilView: View {
    
    var user: User
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Circle()
                    .frame(width: 170, height: 170)
                
                Text(user.username)
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            
            Text("Mes bons de commande")
                .font(.title2)
                .padding()
//                forEach(
        }.padding()
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(user: User.example)
    }
}
