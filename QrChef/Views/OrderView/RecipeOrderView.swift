//
//  RecipeOrderView.swift
//  QrChef
//
//  Created by Thibault GODEFROY on 30/11/2022.
//

import SwiftUI

struct RecipeOrderView: View {
    var body: some View {
        HStack{
            Text("PANCAKES BACON OEUF POCHÉ")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding()
            Text("x2")
                .padding()
            Text("15.35")
                .padding()
                .padding()
           
        } .fontWeight(.semibold)
    }
}

struct RecipeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeOrderView()
    }
}
