//
//  RowView.swift
//  QrChef
//
//  Created by Tatiana Simmer on 29/11/2022.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        HStack{
            Image("Restaurant")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12.0)
                .padding(.all, 100)
            
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
