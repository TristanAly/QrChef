//
//  PostCommand.swift
//  QrChef
//
//  Created by apprenant1 on 05/12/2022.
//

import SwiftUI

struct PostCommand: View {
    
    @State var date: Date = Date.now
    @State var hour: Date = Date.now
    @State var table = "1"
    @State var nbperson = "2"
    @State var price = "12.5"
    
    @EnvironmentObject var vm : CommandViewModel
    @StateObject var restaurantVM: RestaurantViewModel
    var body: some View {
        VStack{
            DatePicker(selection: $date, in: ...Date.distantFuture, displayedComponents: .date) {
                Text("Select a date")
            }
            Text("Date is \(date.formatted(date: .long, time: .omitted))")
            Text("Hour is \(hour.formatted(.dateTime.hour().minute()))")
            DatePicker(selection: $date, in: ...Date.distantFuture, displayedComponents: .hourAndMinute) {
                Text("Select a hour")
            }
            TextField("table", text: $table)
            TextField("table", text: $nbperson)
                .keyboardType(.numberPad)
            TextField("Price", text: $price)
                .keyboardType(.decimalPad)
            Button {
                Task{
                    vm.commands = try await
                    vm.PostCommand(table: table, nbperson: Int(nbperson)!, price: Double(price)!, date: dateFormatter.string(from: Date.now), hour: hourFormatter.string(from: Date.now), restaurantId: restaurantVM.restaurant.id)
                }
            } label: {
                Text("envoie bon de commande")
            }
            .buttonStyle(.borderedProminent)
            
            VStack{
                Text(vm.commands.date ?? "")
                Text(vm.commands.hour ?? "")
            }

        }
        

    }
    func number(test: String) -> Int{
            guard let cost = Int(test) else {
                return 1
            }

            return Int(cost)
        }
    func numberDouble(test: String) -> Double{
            guard let cost = Double(test) else {
                return 1
            }

            return Double(cost)
        }
}

struct PostCommand_Previews: PreviewProvider {
    static var previews: some View {
        PostCommand(restaurantVM: RestaurantViewModel()).environmentObject(CommandViewModel())
    }
}
