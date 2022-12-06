////
////  CommandTestView.swift
////  QrChef
////
////  Created by apprenant1 on 05/12/2022.
////
//
//import SwiftUI
//
//struct CommandTestView: View {
//    
//    @StateObject var commandVM = CommandViewModel()
//   
//    var command: Command
//    var body: some View {
//        VStack{
//            Text("\(commandVM.commands.date ?? Date.now, format: .dateTime.day().month().year()) à \(command.hour ?? Date.now, format: .dateTime.hour().minute())").bold().padding()
//                HStack{
//                    Text("Table: n° \(commandVM.commands.table ?? "123")").padding()
//                    Spacer()
////                    Text("\(commandVM.commands.nbperson) pers.")
//                }
//                
//                HStack{
//                    Spacer()
//                    Text(String("Price: \(commandVM.commands.price) €"))
//                }
//        }
//    }
//}
//
//struct CommandTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommandTestView(command: Command.example)
//            .environmentObject(CommandViewModel())
//    }
//}
