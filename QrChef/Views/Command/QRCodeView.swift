//
//  QRCodeView.swift
//  QrChef
//
//  Created by Cynthia on 05/12/2022.
//

import SwiftUI

struct QRCodeView: View {
    @State var document: FilesDocuments
        @EnvironmentObject var commandVM: CommandViewModel
        @State private var isGenerating: Bool = false
        @State private var isExporting: Bool = false
        
        var body: some View {
            NavigationView{
                VStack {
                    VStack {
                        GroupBox(label: Text("Commande n° \(Command.example.id)")) {
                            VStack{
                                Text("Table: n° \(Command.example.table ?? "123")").padding()
                                Text("\(Command.example.nbperson) personnes")
                                Text(String("Prix: \(Command.example.price) €"))
                                Text("\(Command.example.date ?? Date.now, format: .dateTime.day().month().year()) à \(Command.example.hour ?? Date.now, format: .dateTime.hour().minute())").bold().padding()
    //                            Text(Command.example.hour, format: .dateTime.hour().minute())
                            }.padding()
                        }
                        GroupBox {
                            HStack {
                                Spacer()
                                Button(action:
                                        {
                                    isExporting = true
                                }, label: {
                                    Text("Save")
                                })
                                Spacer()
                                NavigationLink(destination: GeneratorQRCode(document: FilesDocuments(message:  "\(String(describing: Command.example.table))\n\(String(describing: Command.example.nbperson))"))) {
                                    Text("Generate QRCode")
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .fileExporter(
                        isPresented: $isExporting,
                        document: document,
                        contentType: .plainText,
                        defaultFilename: document.message
                    ) { result in
                        if case .success = result {
                            print ("success")
                        } else {
                            print ("Fail")
                        }
                    }
                }
            }
        }

}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(document: FilesDocuments(message: "Ticket de caisse"))
    }
}
