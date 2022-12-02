//
//  NewRowRestaurantView.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import SwiftUI

struct NewRowRestaurantView: View {
    var manager: Manager
    var body: some View {
        VStack{
            Image("Restaurant")
                .resizable()
                .frame(width: 380, height: 150)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(manager.restaurant ?? "")
                            .font(.title)
                        Text(manager.address ?? "")
                            .font(.subheadline)
                    }.padding(.horizontal)
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(manager.restaurant ?? "")
                            .font(.title)
                        Text(manager.restaurant ?? "")
                            .font(.title)
                    }
                    .padding(.horizontal)
                }
            }
            .frame(width: 380, height: 70)
            .background(Rectangle().fill(.red).frame(width: 380, height: 100))
        }
        .cornerRadius(8)
    }
}

struct NewRowRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRowRestaurantView(manager: Manager.example)
    }
}
