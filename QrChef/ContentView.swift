//
//  ContentView.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView(loginVM: LoginViewModel())
//    ListCommand(vm: CommandViewModel())
//        PostCommand(restaurantVM: RestaurantViewModel()).environmentObject(CommandViewModel())
//        ScanQRCodeView(filter: .none, prospects: Prospects(), commandVM: CommandViewModel())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
