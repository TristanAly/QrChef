////
////  ScanQRCodeView.swift
////  QrChef
////
////  Created by Cynthia on 05/12/2022.
////
//
import SwiftUI
import CodeScanner

struct ScanQRCodeView: View {
    let filter: FilterType
    @ObservedObject var prospects: Prospects
    @ObservedObject var commandVM: CommandViewModel
    @State private var isShowingScanner = false
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(filteredProspects) { prospect in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: QRCodeView(document: FilesDocuments(message: prospect.nbperson),commandVM: commandVM, recipeVM: RestaurantViewModel())) {
                                VStack{
                                    Text(prospect.userId)
                                        .font(.headline)
                                    Text(prospect.nbperson)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                Button(action: {
                    isShowingScanner = true
                }, label: {
                    Text("Scan")
                })
                
            }.sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
            //            .toolbar {
            //                Button {
            //                    var prospect = Command(id: 0, nbperson: Command.example.nbperson, price: 0.01)
            //                    prospect.id = Command.example.id
            //                    prospect.table = Command.example.table
            //                    prospect.nbperson = Command.example.nbperson
            //                    prospects.people.append(prospect)
            //                } label: {
            //                    Label("Scan", systemImage: "qrcode.viewfinder")
            //                }
            //            }
        }
    }
    var filteredProspects: [CommandScan] {
        switch filter {
        case .none:
            return prospects.people
        }
    }
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 4 else { return }
            
            let person = CommandScan()
            
            //                person.id = details[0]
            person.nbperson = details[0]
            person.userId = details[1]
            person.date = details[2]
            person.hour = details[3]
            
            
            prospects.people.append(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
}

struct ScanQRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRCodeView(filter: FilterType.none, prospects: Prospects(), commandVM: CommandViewModel())
        //            .environmentObject(Prospects())
    }
}

class CommandScan: Identifiable, Codable {
    var id = UUID()
    var nbperson: String = ""
    var userId: String = ""
    var date: String = ""
    var hour: String = ""
}
