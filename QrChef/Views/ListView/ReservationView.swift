
//  ReservationView.swift
//  QrChef
//
//  Created by apprenant1 on 06/12/2022.


import SwiftUI

struct ReservationView: View {
    
    @State var date: Date = Date.now
    @State var hour: Date = Date.now
    @State var table = "1"
    @State var nbperson = "2"
    @State var price = "12.5"
    
    @StateObject var vm = CommandViewModel()
    @StateObject var restaurantVM: RestaurantViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    @State var show = false
    var body: some View {
        VStack{
            Text("Your reservation")
                .font(.title)
            Form{
                Section{
                    DatePicker(selection: $date, in: ...Date.distantFuture, displayedComponents: .date) {
                        Text("Select a date")
                    }
                    DatePicker(selection: $hour, in: ...Date.distantFuture, displayedComponents: .hourAndMinute) {
                        Text("Select a hour")
                    }
                    HStack{
                        TextField("table", text: $table)
                        Text("n° table")
                    }
                    HStack{
                    TextField("table", text: $nbperson)
                        .keyboardType(.numberPad)
                        Text("n° pers.")
                    }
                    HStack{
                    TextField("table", text: $price)
                        .keyboardType(.numberPad)
                        Text("n° pers.")
                    }
                }
                .textFieldStyle(.roundedBorder)
            }
            VStack(alignment: .center){
                Button {
                    Task{
                        vm.commands = try await
                        vm.PostCommand(table: table, nbperson: Int(nbperson)!, price: Double(price)!, date: dateFormatter.string(from: Date.now), hour: hourFormatter.string(from: Date.now), restaurantId: restaurantVM.restaurant.id)
                    }
                } label: {
                    Text("Reservez")
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}


struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(restaurantVM: RestaurantViewModel())
            .environmentObject(CommandViewModel())
    }
}
