//
//  ProfilView.swift
//  QrChef
//
//  Created by apprenant1 on 01/12/2022.
//

import SwiftUI

struct ProfilView: View {
    
    @StateObject var userVM = UserViewModel()
   @State var arraytest = ["gdgdggd","gfgfdhq", "fggdhfdgh"]
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(userVM.user, id: \.id) { user in
                HStack{
                    
                    Circle()
                        .frame(width: 170, height: 170)
                    
                    Text(user.username)
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
            }
            Text("Mes bons de commande")
                .font(.title2)
                .padding()
            List{
                ForEach(arraytest, id: \.self) { test in
                    Text(test)
                }
            }
        }.padding()
            .onAppear{
                Task{
                    userVM.user = try await userVM.getUser()
                }
            }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
            .environmentObject(UserViewModel())
    }
}
