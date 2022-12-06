//
//  BtnCourses.swift
//  QrChef
//
//  Created by apprenant1 on 05/12/2022.
//

import SwiftUI

struct BtnCourses: View {
    var body: some View {
        ZStack{
            Button {
                //
            } label: {
                Text("Mon panier")
                    .padding()
            }
            .background(.red)
            .cornerRadius(8)
            .padding()
        }
    }
}

struct BtnCourses_Previews: PreviewProvider {
    static var previews: some View {
        BtnCourses()
    }
}
