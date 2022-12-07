////
////  QRCodeView.swift
////  QrChef
////
////  Created by Cynthia on 05/12/2022.
////
//
import SwiftUI

struct QRCodeView: View {
    @State var document: FilesDocuments
    @EnvironmentObject var commandVM: CommandViewModel
    @StateObject var recipeVM: RestaurantViewModel
    @State private var isGenerating: Bool = false
    @State private var isExporting: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    GroupBox(label: Text("Commande n° \(commandVM.commands.id)")) {
                        VStack{
                            Text("\(commandVM.commands.date!) à \(commandVM.commands.hour!)")
                            HStack{
                                Text("Table: n° \(commandVM.commands.table!)")
                                Spacer()
                                Text("\(commandVM.commands.nbperson!) pers.")
                            }
                            if let command = commandVM.commands.recipes { ForEach(command, id: \.id) { recipe in
                                HStack{
                                    Text(recipe.name ?? "")
                                    Spacer()
                                    Text("\(recipe.priceRange ?? 0)")
                                }
                            }
                            }
                            HStack{
                                Spacer()
                                Text(String("Price: \(commandVM.commands.price!) €"))
                            }
                            
                            
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
                            NavigationLink(destination: GeneratorQRCode(document: FilesDocuments(message: "Commande n° \(commandVM.commands.id)\n avec \(commandVM.commands.nbperson!)\n \(String(describing: commandVM.commands.userId))\n \(String(describing: commandVM.commands.date)) à \(String(describing: commandVM.commands.hour))"))) {
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
        QRCodeView(document: FilesDocuments(message: "Ticket de caisse"), recipeVM: RestaurantViewModel()).environmentObject(CommandViewModel())
    }
}
