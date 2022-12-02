//
//  TopManagerListView.swift
//  QrChef
//
//  Created by apprenant1 on 02/12/2022.
//

import SwiftUI

struct TopManagerListView: View {
    var manager: Manager
    var body: some View {
        VStack{
//            AsyncImage(url: URL(string: manager.image ?? ""))
            AsyncImage(url: URL(string: ""))
                .frame(height: 150)
            HStack{
                VStack(alignment: .leading){
                    Text(manager.address ?? "test")
                        .font(.headline)
                    Text(manager.name ?? "test")
                        .font(.headline)
                }.padding()
                Spacer()
            }
        }
    }
}

struct TopManagerListView_Previews: PreviewProvider {
    static var previews: some View {
        TopManagerListView(manager: Manager.example)
    }
}
