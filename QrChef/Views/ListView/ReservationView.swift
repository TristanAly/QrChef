//
//  ReservationView.swift
//  QrChef
//
//  Created by apprenant1 on 06/12/2022.
//

import SwiftUI

struct ReservationView: View {
    
    @State var date: Date = Date.now
    @State var hour: Date = Date.now
    @State var table = "1"
//    @State var nbperson = "2"
    @State var nbperson = 2
    @State var price = "12.5"
    @State var selected = 0
    
    
    @StateObject var vm : CommandViewModel
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    var tabletest : Table
    @State var show = false
    var body: some View {
        VStack{
                Text("Your reservation")
                    .font(.title2)
                Form{
                    Section{
                        Picker("Number of people", selection: $nbperson) {
                            ForEach(2 ..< 11) {
                                Text("\($0) people")
                            }
                        }
                    }
                    Section{
                        DatePicker(selection: $date, in: ...Date.distantFuture, displayedComponents: .date) {
                            Text("Select a date")
                        }
                    }
                    
                }
            VStack(alignment: .center){
                Button {
                    Task{
                        vm.commands = try await vm.PostCommand( table:table,nbperson: nbperson  ,price: numberDouble(test: price), date: date, hour: hour, restaurantId: 1 )
                    }
                } label: {
                    Text("Reservez")
                }
                .buttonStyle(.borderedProminent)
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

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(vm: CommandViewModel(), tabletest: tableArray[0])
    }
}
