//
//  TableRservationView.swift
//  QrChef
//
//  Created by apprenant1 on 06/12/2022.
//

import SwiftUI

struct TableReservationView: View {
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    var table : Table
    @State var show = false
    var body: some View {
        VStack{
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(tableArray, id: \.id) { table in
                    Button {
                        //
                        show.toggle()
                    } label: {
                        VStack{
                            Text("n° \(table.table)")
                            Text(table.hour)
                        }
                        .foregroundColor(.white)
                        .bold()
                        .padding(5)
                        .padding(.horizontal,5)
                        .background(
                            .red)
                        .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct TableReservationView_Previews: PreviewProvider {
    static var previews: some View {
        TableReservationView(table: tableArray[0])
    }
}

struct Table: Identifiable {
    let id: Int
    let table: String
    let hour: String
}

var tableArray = [
    Table(id: 1, table: "1", hour: "12h10"),
    Table(id: 2,table: "2", hour: "12h10"),
    Table(id: 3,table: "3", hour: "13h10"),
    Table(id: 4,table: "4", hour: "12h10"),
    Table(id: 5,table: "5", hour: "12h10"),
    Table(id: 6,table: "6", hour: "13h10"),
    Table(id: 7,table: "7", hour: "13h10"),
    Table(id: 8,table: "8", hour: "12h10"),
    Table(id: 9,table: "9", hour: "13h10"),
    Table(id: 10,table: "10", hour: "12h10"),
]
