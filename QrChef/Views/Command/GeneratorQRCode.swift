//
//  GeneratorQRCode.swift
//  QrChef
//
//  Created by Cynthia on 05/12/2022.
//

import SwiftUI

struct GeneratorQRCode: View {
    @State var document: FilesDocuments
        var body : some View{
            VStack{
                Text("Bon de commande").font(.title).padding()
                Image(uiImage: generateQRCode(from: document.message))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }
}

struct GeneratorQRCode_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorQRCode(document: FilesDocuments(message: ""))
    }
}
