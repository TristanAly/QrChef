//
//  ManagerView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 02/12/2022.
//

import SwiftUI

struct ManagerView: View {
    @State var name = ""
    @State var email = ""
    @State var restaurant = ""
    @State var address = ""
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    TextField("Enter your name", text: $name)
                }
                Section {
                    TextField("Enter your email", text: $email)
                }
                Section {
                    TextField("Enter restaurant name", text: $restaurant)
                }
                Section {
                    TextField("Enter restaurant address", text: $address)
                }
            }
            .navigationTitle("Resto")
        }
    }
}

struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
